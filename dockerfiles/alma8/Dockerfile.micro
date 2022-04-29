ARG SYSBASE=almalinux/8-base
FROM ${SYSBASE} as system-build

RUN mkdir -p /mnt/sys-root; \
    dnf install --installroot /mnt/sys-root coreutils-single glibc-minimal-langpack \
    --releasever 8 --setopt install_weak_deps=false --nodocs -y; \
    dnf --installroot /mnt/sys-root clean all; \
    rm -rf /mnt/sys-root/var/cache/* /mnt/sys-root/var/log/dnf* /mnt/sys-root/var/log/yum.*; \
    # cp /etc/yum.repos.d/*.repo /mnt/sys-root/etc/yum.repos.d/; \
    # generate build time file for compatibility with CentOS
    /bin/date +%Y%m%d_%H%M > /mnt/sys-root/etc/BUILDTIME ;

FROM scratch

COPY --from=system-build /mnt/sys-root/ /

CMD /bin/sh