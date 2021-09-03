# AlmaLinux 8 kickstart file for aarch64 base Docker image

# install
url --url https://repo.almalinux.org/almalinux/8/BaseOS/aarch64/os/

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
coreutils-single
glibc-minimal-langpack
-crypto-policies-scripts
-dosfstools
-e2fsprogs
-fuse-libs
-gnupg2-smime
-kernel
-langpacks-en
-libss
-open-vm-tools
-pinentry
-qemu-guest-agent
-shared-mime-info
-trousers
-xfsprogs
-xkeyboard-config
%end

%pre
# Pre configure tasks for Docker

# Don't add the anaconda build logs to the image
# see /usr/share/anaconda/post-scripts/99-copy-logs.ks
touch /tmp/NOSAVE_LOGS
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

# remove unnecessary files
rm -rfv /var/lib/dnf \
      /run/nologin
rm -rfv /var/log/* \
       /tmp/* /tmp/.* \
       /boot || true
%end

%post --nochroot --logfile=/mnt/sysimage/root/anaconda-post-nochroot.log --erroronfail
set -eux

# https://bugzilla.redhat.com/show_bug.cgi?id=1343138
umount /mnt/sysimage/run
# We don't have systemd and need to create manually
install -d /mnt/sysimage/run/lock -m 0755 -o root -g root

find /mnt/sysimage/usr/share/locale/* -not \( -name 'locale.alias' -o -name POSIX \) -delete
%end
