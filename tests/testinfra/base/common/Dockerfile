ARG SYS_BASE
FROM ${SYS_BASE} 

RUN mkdir /mnt/sys-root; \
    dnf install \
    --setopt install_weak_deps=false \
    --nodocs -y \
    nginx \
    nodejs \
    npm \
    podman \
    which \
    python3 \
    podman-docker; 

WORKDIR /project

CMD /bin/bash

