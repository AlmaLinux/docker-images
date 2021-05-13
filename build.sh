#!/bin/bash
# description: AlmaLinux base Docker image rootfs and Dockerfile generation
#              script.
# license: MIT.

set -euo pipefail

RELEASE_VER='8'
IMAGE_NAME="almalinux-${RELEASE_VER}-docker.tar.xz"
KS_PATH="./kickstarts/almalinux-${RELEASE_VER}.ks"
OUTPUT_DIR="./result"


if [[ -d "${OUTPUT_DIR}" ]]; then
    echo "Output directory ${OUTPUT_DIR} already exists, please remove it"
    exit 1
fi


livemedia-creator --no-virt --make-tar --ks "${KS_PATH}" \
                  --image-name="${IMAGE_NAME}" \
                  --project "AlmaLinux OS ${RELEASE_VER} Docker" \
                  --releasever "${RELEASE_VER}" \
                  --resultdir "${OUTPUT_DIR}"


cat << EOF > "${OUTPUT_DIR}/Dockerfile"
FROM scratch
ADD ${IMAGE_NAME} /

CMD ["/bin/bash"]
EOF
