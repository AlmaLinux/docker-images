# AlmaLinux 8 kickstart file for x86_64 base Docker image

# install
url --url https://repo.almalinux.org/almalinux/8/BaseOS/$basearch/os/

lang en_US.UTF-8
keyboard us
timezone --nontp --utc UTC

network --activate --bootproto=dhcp --device=link --onboot=on
selinux --disabled

bootloader --disable
zerombr
clearpart --all --initlabel
autopart --fstype=ext4 --type=plain --nohome --noboot --noswap

rootpw --iscrypted --lock almalinux

shutdown

%packages --ignoremissing --excludedocs --instLangs=en --nocore --excludeWeakdeps
almalinux-release
bash
binutils
coreutils-single
dnf
findutils
glibc-minimal-langpack
hostname
iputils
less
rootfiles
tar
vim-minimal
yum
xz

-brotli
-crypto-policies-scripts
-firewalld
-diffutils
-elfutils-debuginfod-client
-gettext*
-glibc-langpack-en
-gnupg2-smime
-grub\*
-iptables
-kernel
-libevent
-openssl
-os-prober
-open-vm-tools
-pinentry
-platform-python-pip
-shared-mime-info
-trousers
-unbound-libs
-xkeyboard-config
%end


# NOTE: add --log=/root/anaconda-post.log for debugging
%post --erroronfail
# generate build time file for compatibility with CentOS
/bin/date +%Y%m%d_%H%M > /etc/BUILDTIME

# set DNF infra variable to container for compatibility with CentOS
echo 'container' > /etc/dnf/vars/infra

# import AlmaLinux PGP key
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux

# install only en_US.UTF-8 locale files, see
# https://fedoraproject.org/wiki/Changes/Glibc_locale_subpackaging for details
LANG="en_US"
echo '%_install_langs en_US.UTF-8' > /etc/rpm/macros.image-language-conf

# https://bugzilla.redhat.com/show_bug.cgi?id=1727489
echo 'LANG="C.UTF-8"' >  /etc/locale.conf
# force each container to have a unique machine-id
> /etc/machine-id

# create tmp directories because there is no tmpfs support in Docker
umount /run
systemd-tmpfiles --create --boot

# disable login prompt and mounts
systemctl mask console-getty.service \
               dev-hugepages.mount \
               getty.target \
               systemd-logind.service \
               sys-fs-fuse-connections.mount \
               systemd-remount-fs.service

# remove unnecessary files
rm -f /var/lib/dnf/history.* \
      /run/nologin
rm -fr /var/log/* \
       /tmp/* /tmp/.* \
       /boot || true
%end
