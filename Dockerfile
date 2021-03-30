FROM scratch
ADD almalinux-8-docker.tar.xz /

# see https://github.com/opencontainers/image-spec/blob/master/annotations.md for details
LABEL org.opencontainers.image.title="AlmaLinux OS 8 Base Image"
LABEL org.opencontainers.image.vendor="AlmaLinux OS"
# TODO: should we list all included RPM package licenses here?
#       Right now it is just our Dockerfile/build scripts license.
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.created="2021-03-30 21:49:32+00:00"
LABEL org.opencontainers.image.authors="Eugene Zamriy <ezamriy@almalinux.org>"
LABEL org.opencontainers.image.source="https://github.com/AlmaLinux/docker-images"
LABEL org.opencontainers.image.url="https://github.com/AlmaLinux/docker-images"

CMD ["/bin/bash"]
