# AlmaLinux 8 kickstart file for aarch64 base Docker image

# install
url --url https://repo.almalinux.org/almalinux/8/BaseOS/aarch64/os/

lang en_US.UTF-8
keyboard us
timezone --nontp --utc UTC

network --activate --bootproto=dhcp --device=link --onboot=on
firewall --disabled
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
brotli
coreutils-single
crypto-policies-scripts
cryptsetup-libs
dbus
dbus-common
dbus-daemon
dbus-tools
device-mapper
device-mapper-libs
dmidecode
dnf
dnf-plugin-subscription-manager
findutils
glibc-minimal-langpack
gdb-gdbserver
gobject-introspection
libcurl
libuser
librhsm
passwd
procps-ng
publicsuffix-list-dafsa-20180723-1
python3-chardet
python3-dateutil
python3-dbus
python3-decorator
python3-dmidecode
python3-dnf-plugins-core
python3-ethtool
python3-gobject-base
python3-idna
python3-iniparse
python3-inotify
python3-librepo
python3-libxml2
python3-pysocks
python3-requests
python3-six
python3-subscription-manager-rhsm
python3-syspurpose
python3-urllib3
rdma-core
rootfiles
tar
subscription-manager
systemd
systemd-pam
tpm2-tss
usermode
vim-minimal
virt-what
which
yum

-binutils
-diffutils
-elfutils-debuginfod-client
-firewalld
-gettext*
-glibc-langpack-en
-gnupg2-smime
-grub\*
-hostname
-iputils
-kernel
-less
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
-xz
%end


%post --erroronfail --log=/root/anaconda-post.log
# generate build time file for compatibility with CentOS
/bin/date +%Y%m%d_%H%M > /etc/BUILDTIME

# set DNF infra variable to container for compatibility with CentOS
echo 'container' > /etc/dnf/vars/infra

# import AlmaLinux PGP key
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux

# install only en_US.UTF-8 locale files, see
# https://fedoraproject.org/wiki/Changes/Glibc_locale_subpackaging for details
echo '%_install_langs en_US.UTF-8' > /etc/rpm/macros.image-language-conf

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
