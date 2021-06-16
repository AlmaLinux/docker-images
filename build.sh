#!/bin/bash
# description: AlmaLinux base Docker image rootfs and Dockerfile generation
#              script.
# license: MIT.

set -euo pipefail

PARM='-t'
TYPE='default'

if [ "$#" == "0" ]; then
    echo "No input parameter passed, processing 'default' build"
else
    if [ "$#" == "2" ]; then
        PARM=$1
        TYPE=$2 
    else    
        echo "Invalid input arguments. Use './build.sh -t default|minimal'"
        exit 1
    fi
fi

if [ "$PARM" != "-t" ]; then
    echo "Invalid option; Use '-t' to specify build type"
    exit 1
fi

if [ "$TYPE" != "default" ] && [ "$TYPE" != "minimal" ]; then
    echo "Invalid type '$TYPE'; Use 'default' OR 'minimal' as build type"
    exit 1
fi

RELEASE_VER='8'
ARCH="$(uname -m)"
IMAGE_NAME="almalinux-${RELEASE_VER}-${TYPE}-docker.tar.xz"
KS_PATH="./kickstarts/almalinux-${RELEASE_VER}-${TYPE}.${ARCH}.ks"
OUTPUT_DIR="./result"
DOCKER_FILE=${OUTPUT_DIR}/Dockerfile-${TYPE}


if [[ -d "${OUTPUT_DIR}" ]]; then
    echo "Output directory ${OUTPUT_DIR} already exists, please remove it"
    exit 1
fi


livemedia-creator --no-virt --make-tar --ks "${KS_PATH}" \
                  --image-name="${IMAGE_NAME}" \
                  --project "AlmaLinux OS ${RELEASE_VER}-${TYPE} Docker" \
                  --releasever "${RELEASE_VER}" \
                  --resultdir "${OUTPUT_DIR}"


cat << EOF > "${DOCKER_FILE}"
FROM scratch
ADD ${IMAGE_NAME} /

CMD ["/bin/bash"]
EOF
