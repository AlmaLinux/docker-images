ARG SYS_MINIMAL
FROM ${SYS_MINIMAL}

RUN mkdir /mnt/sys-root; \
    microdnf install -y \
    nginx \
    nodejs \
    npm \
    podman \
    which \
    podman-docker; 

WORKDIR /project

CMD /bin/bash

