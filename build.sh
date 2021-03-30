#!/bin/bash
# description: AlmaLinux base Docker image rootfs and Dockerfile generation
#              script.
# license: MIT.

set -euo pipefail

RELEASE_VER='8'
IMAGE_NAME="almalinux-${RELEASE_VER}-docker.tar.xz"
KS_PATH="./kickstarts/almalinux-${RELEASE_VER}.ks"
OUTPUT_DIR="./result"


if [[ -d OUTPUT_DIR ]]; then
    echo "Output directory ${OUTPUT_DIR} is already exist, please remove it"
    exit 1
fi


livemedia-creator --no-virt --make-tar --ks "${KS_PATH}" \
                  --image-name="${IMAGE_NAME}" \
                  --project "AlmaLinux OS ${RELEASE_VER} Docker" \
                  --releasever "${RELEASE_VER}" \
                  --resultdir "${OUTPUT_DIR}"


BUILD_DATE="$(date --rfc-3339=seconds --utc)"

cat << EOF > ${OUTPUT_DIR}/Dockerfile
FROM scratch
ADD ${IMAGE_NAME} /

# see https://github.com/opencontainers/image-spec/blob/master/annotations.md for details
LABEL org.opencontainers.image.title="AlmaLinux OS 8 Base Image"
LABEL org.opencontainers.image.vendor="AlmaLinux OS"
# TODO: should we list all included RPM package licenses here?
#       Right now it is just our Dockerfile/build scripts license.
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.created="${BUILD_DATE}"
LABEL org.opencontainers.image.authors="Eugene Zamriy <ezamriy@almalinux.org>"
LABEL org.opencontainers.image.source="https://github.com/AlmaLinux/docker-images"
LABEL org.opencontainers.image.url="https://github.com/AlmaLinux/docker-images"

CMD ["/bin/bash"]
EOF
