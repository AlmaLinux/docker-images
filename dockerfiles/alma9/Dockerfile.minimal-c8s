ARG SYSBASE=quay.io/centos/centos:stream9
FROM ${SYSBASE} as system-build

RUN mkdir /mnt/sys-root; \
    dnf install \
#    --nogpgcheck --repoid=AppStream --repoid=BaseOS \
#    --repofrompath='BaseOS,https://repo.almalinux.org/almalinux/9/BaseOS/$basearch/os/' \
#    --repofrompath='AppStream,https://repo.almalinux.org/almalinux/9/AppStream/$basearch/os/' \
    --installroot /mnt/sys-root \
    --releasever 9 \
    --setopt install_weak_deps=false \
    --nodocs -y \
    microdnf \
    ; \
    dnf --installroot /mnt/sys-root clean all; \
    rm -rf /mnt/sys-root/var/log/dnf* /mnt/sys-root/var/log/yum.*; \
    rm -rf /mnt/sys-root/var/lib/dnf/history* /var/log/hawkey.log  /mnt/sys-root/boot /mnt/sys-root/dev/null /mnt/sys-root/run/*; \
    mkdir -p /mnt/sys-root/run/lock; \
    # rm -rf /mnt/sys-root/var/cache/*  removed line
    # cp /etc/yum.repos.d/*.repo /mnt/sys-root/etc/yum.repos.d/; \
    # generate build time file for compatibility with CentOS
    /bin/date +%Y%m%d_%H%M > /mnt/sys-root/etc/BUILDTIME; \
    echo '%_install_langs C.utf8' > /mnt/sys-root/etc/rpm/macros.image-language-conf; \
    echo 'LANG="C.utf8"' >  /mnt/sys-root/etc/locale.conf; \
    echo 'container' > /mnt/sys-root/etc/dnf/vars/infra; \
    rm -f /mnt/sys-root/etc/machine-id; \
    touch /mnt/sys-root/etc/machine-id;

# Almalinux minimal build
FROM scratch 
COPY --from=system-build /mnt/sys-root/ /

CMD ["/bin/bash"]