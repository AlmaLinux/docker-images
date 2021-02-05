FROM scratch
ADD almalinux-8-docker.tar.xz /

# see https://github.com/opencontainers/image-spec/blob/master/annotations.md for details
LABEL org.opencontainers.image.title="AlmaLinux Base Image"
LABEL org.opencontainers.image.vendor="AlmaLinux"
# TODO: should we list all included RPM package licenses here?
#       Right now it is just our Dockerfile/build scripts license.
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.created="2021-02-05 20:30:31+00:00"
LABEL org.opencontainers.image.authors="Eugene Zamriy <ezamriy@cloudlinux.com>"
LABEL org.opencontainers.image.source="https://github.com/AlmaLinux/docker-images"
LABEL org.opencontainers.image.url="https://github.com/AlmaLinux/docker-images"

CMD ["/bin/bash"]
