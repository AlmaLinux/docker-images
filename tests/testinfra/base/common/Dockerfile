# hadolint ignore=DL3006
ARG SYSBASE=almalinux/9-base
FROM ${SYSBASE} as system-build

RUN mkdir /mnt/sys-root; \
    dnf install \
#    --nogpgcheck --repoid=AppStream --repoid=BaseOS \
#    --repofrompath='BaseOS,https://repo.almalinux.org/almalinux/9/BaseOS/$basearch/os/' \
#    --repofrompath='AppStream,https://repo.almalinux.org/almalinux/9/AppStream/$basearch/os/' \
#    --installroot /mnt/sys-root \
#    --releasever 9 \
    --setopt install_weak_deps=false \
    --nodocs -y \
    nginx \
    nodejs \
    npm \
    podman \
    which \
    podman-docker; 

WORKDIR /project

CMD /bin/bash

