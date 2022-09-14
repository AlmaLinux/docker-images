ARG SYS_INIT
FROM ${SYS_INIT}

RUN mkdir /mnt/sys-root; \
    dnf install \
    --setopt install_weak_deps=false \
    --nodocs -y \
    nginx \
    nodejs \
    npm \
    podman \
    python3 \
    which \
    podman-docker; 

WORKDIR /project

CMD /bin/bash

