FROM almalinux:8.4 as builder

RUN mkdir /mnt/alma-root; \
    dnf install --installroot /mnt/alma-root  --releasever 8 --setopt install_weak_deps=false --nodocs -y coreutils-single \
    glibc-minimal-langpack \
    json-glib \
    langpacks-en \
    microdnf \
    rootfiles; \
    rm -rf /mnt/alma-root/var/cache/* ; \
    dnf clean all; \
    cp /etc/yum.repos.d/* /mnt/alma-root/etc/yum.repos.d/ ; \
    rm -rf /var/cache/yum; \
    # generate build time file for compatibility with CentOS
    /bin/date +%Y%m%d_%H%M > /mnt/alma-root/etc/BUILDTIME ;\
    # set DNF infra variable to container for compatibility with CentOS
    echo 'container' > /mnt/alma-root/etc/dnf/vars/infra; \
    # install only en_US.UTF-8 locale files, see
    # https://fedoraproject.org/wiki/Changes/Glibc_locale_subpackaging for details
    echo '%_install_langs en_US.UTF-8' > /mnt/alma-root/etc/rpm/macros.image-language-conf ;\
    > /mnt/alma-root/etc/machine-id


# Almalinux minimal build
FROM scratch 
COPY --from=builder /mnt/alma-root/ /
LABEL org.label-schema.schema-version="1.0" \
    maintainer="AlmaLinux SIG Team" \
    org.opencontainers.image.authors="Bala Raman <srbala at gmail>" \
    org.opencontainers.image.description="AlmaLinux Minimal Image, Base kernel with microdnf installer" \
    org.label-schema.name="AlmaLinux Base Image Minimal" \
    org.label-schema.vendor="AlmaLinux OS Foundation" \
    org.label-schema.license="MIT" \
    org.label-schema.build-date="20210614" \
    org.opencontainers.image.title="AlmaLinux Base Image Minimal" \
    org.opencontainers.image.vendor="AlmaLinux OS Foundation" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.created="2021-06-14 00:00:00+01:00"
CMD ["/bin/bash"]
