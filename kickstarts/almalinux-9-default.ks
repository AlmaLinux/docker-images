# AlmaLinux 9 kickstart file for x86_64 default Container image

url --url https://repo.almalinux.org/almalinux/9/BaseOS/$basearch/kickstart/
repo --name=BaseOS --baseurl=https://repo.almalinux.org/almalinux/9/BaseOS/$basearch/os/
repo --name=AppStream --baseurl=https://repo.almalinux.org/almalinux/9/AppStream/$basearch/os/

lang C.UTF-8
keyboard us
timezone --nontp --utc UTC

network --activate --bootproto=dhcp --device=link --onboot=on
selinux --disabled

bootloader --disabled
zerombr
clearpart --all --initlabel
autopart --fstype=ext4 --type=plain --nohome --noboot --noswap

rootpw --iscrypted --lock almalinux

shutdown

%packages --excludedocs --nocore --instLangs=en --excludeWeakdeps
almalinux-release
bash
binutils
coreutils-single
crypto-policies-scripts
curl-minimal
findutils
hostname
iputils
glibc-minimal-langpack
less
libcurl-minimal
rootfiles
tar
vim-minimal
yum
xz
-dosfstools
-e2fsprogs
-gnupg2-smime
-kernel
-langpacks-*
-langpacks-en
-libss
-open-vm-tools
-pinentry
-qemu-guest-agent
-subscription-manager
-trousers
-xfsprogs
-xkeyboard-config
%end


# NOTE: add --log=/root/anaconda-post.log for debugging
%post --erroronfail
# generate build time file for compatibility with CentOS
/bin/date +%Y%m%d_%H%M > /etc/BUILDTIME

# Change format of the RPM database from Berkeley DB to a new SQLite format
rpmdb --rebuilddb

# set DNF infra variable to container for compatibility with CentOS
echo 'container' > /etc/dnf/vars/infra

# import AlmaLinux PGP key
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux

# install only C.UTF-8 locale files, see
# https://fedoraproject.org/wiki/Changes/Glibc_locale_subpackaging for details
LANG="C.utf8"
echo "%_install_langs $LANG" > /etc/rpm/macros.image-language-conf

# https://bugzilla.redhat.com/show_bug.cgi?id=1727489
echo 'LANG="C.UTF-8"' >  /etc/locale.conf

# force each container to have a unique machine-id
> /etc/machine-id

# create tmp directories because there is no tmpfs support in Docker
umount /run
systemd-tmpfiles --create --boot

# disable login prompt, mounts and fix: https://bugzilla.redhat.com/show_bug.cgi?id=1472439
systemctl mask systemd-remount-fs.service \
               dev-hugepages.mount \
               sys-fs-fuse-connections.mount \
               systemd-logind.service \
               getty.target \
               console-getty.service

KEEPLANG=en_US
for dir in locale i18n; do
    find /usr/share/${dir} -mindepth  1 -maxdepth 1 -type d -not \( -name "${KEEPLANG}" -o -name POSIX \) -exec rm -rfv {} +
done

# remove unnecessary files
rm -f /var/lib/dnf \
      /run/nologin
rm -fr /var/log/* \
       /tmp/* /tmp/.* \
       /boot || true
%end
