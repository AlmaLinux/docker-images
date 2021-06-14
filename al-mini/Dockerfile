FROM almalinux:8.4 as builder

RUN mkdir /mnt/alma-root; \
    dnf install --installroot /mnt/alma-root  --releasever 8 --setopt install_weak_deps=false --nodocs -y coreutils-single microdnf; \
    rm -rf /mnt/alma-root/var/cache/* ; \
    dnf clean all; \
    cp /etc/yum.repos.d/* /mnt/alma-root/etc/yum.repos.d/ ; \
    rm -rf /var/cache/yum

# Almalinux minimal build
FROM scratch 
COPY --from=builder /mnt/alma-root/ /
CMD /bin/sh
