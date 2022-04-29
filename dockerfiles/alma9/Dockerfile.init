ARG SYSBASE=almalinux
FROM ${SYSBASE} as system-build

RUN mkdir /mnt/sys-root; \
    dnf install \
    --nogpgcheck --repoid=AppStream --repoid=BaseOS \
    --repofrompath='BaseOS,https://repo.almalinux.org/almalinux/9/BaseOS/$basearch/os/' \
    --repofrompath='AppStream,https://repo.almalinux.org/almalinux/9/AppStream/$basearch/os/' \
    --installroot /mnt/sys-root \
    --releasever 9 \
    --setopt install_weak_deps=false \
    --nodocs -y \
    coreutils-single \
    crypto-policies-scripts \
    findutils \
    gdb-gdbserver \
    glibc-minimal-langpack \
    gzip \
    libuser \
    passwd \
    procps-ng \ 
    rootfiles \
    systemd \
    tar \
    usermode \
    vim-minimal \
    virt-what \
    which \
    yum \
    hwdata \
    iptables-libs \
    langpacks-en \
    libibverbs \
#    libmetalink \
    libnl3 \
    libpcap \
    pciutils \
    pciutils-libs \
    rdma-core \    
    ; \
    dnf --installroot /mnt/sys-root clean all; \
    rm -rf /mnt/sys-root/var/cache/* /mnt/sys-root/var/log/dnf* /mnt/sys-root/var/log/yum.*; \
    # cp /etc/yum.repos.d/*.repo /mnt/sys-root/etc/yum.repos.d/; \
    # generate build time file for compatibility with CentOS
    /bin/date +%Y%m%d_%H%M > /mnt/sys-root/etc/BUILDTIME; \
    echo '%_install_langs C.utf8' > /mnt/sys-root//etc/rpm/macros.image-language-conf; \
    echo 'LANG="C.utf8"' >  /mnt/sys-root/etc/locale.conf; \
    echo 'container' > /mnt/sys-root/etc/dnf/vars/infra; \
    rm -f /mnt/sys-root/etc/machine-id; \
    touch /mnt/sys-root/etc/machine-id;


FROM scratch

COPY --from=system-build /mnt/sys-root/ /

ENV LANG=C.utf8 

RUN systemctl set-default multi-user.target; \
    systemctl mask systemd-remount-fs.service \
    dev-hugepages.mount \
    sys-fs-fuse-connections.mount \
    systemd-logind.service \
    getty.target \
    console-getty.service \
    systemd-udev-trigger.service \
    systemd-udevd.service \
    systemd-random-seed.service \
    systemd-machine-id-commit.service

CMD ["/sbin/init"]

STOPSIGNAL SIGRTMIN+3