#!/bin/bash
# description: AlmaLinux base Docker image rootfs and Dockerfile generation
#              script.
# license: MIT.

set -euo pipefail

RELEASE_VER='8'
ARCH="$(uname -m)"
OUTPUT_DIR='./result'
TYPE='default'

OPTIND=1


show_usage() {
    echo -e 'Generates an AlmaLinux OS rootfs and Dockerfile\n'
    echo -e 'Usage: build.sh [OPTION]...\n'
    echo '  -h        show this message and exit'
    echo '  -o        output directory path. Default is "./result"'
    echo '  -t        image build type like "default", "init", "micro", "minimal". Default is "default"'
}


save_logs() {
    local -r logs_dir="${1}"
    mkdir -p "${logs_dir}"
    if [[ -d anaconda ]]; then
        mv anaconda "${logs_dir}/"
    fi
    mv *.log "${logs_dir}/"
}


while getopts "ho:t:" opt; do
    case "${opt}" in
        h)
            show_usage
            exit 0
            ;;
        o)
            OUTPUT_DIR="${OPTARG}"
            ;;
        t)
            case "${OPTARG}" in
                default|init|micro|minimal)
                    TYPE="${OPTARG}"
                    ;;
                *)
                    echo "Error: unsupported build type ${OPTARG}" 1>&2
                    exit 1
                    ;;
            esac
            ;;
        *)
            exit 1
            ;;
    esac
done

if [[ -d "${OUTPUT_DIR}" ]]; then
    echo "Error: output directory ${OUTPUT_DIR} already exists, please remove it" 1>&2
    exit 1
fi


IMAGE_NAME="almalinux-${RELEASE_VER}-docker.${TYPE}.tar.xz"
KS_PATH="./kickstarts/almalinux-${RELEASE_VER}-${TYPE}.${ARCH}.ks"
DOCKER_FILE=${OUTPUT_DIR}/Dockerfile


livemedia-creator --no-virt --make-tar --ks "${KS_PATH}" \
                  --image-name="${IMAGE_NAME}" \
                  --project "AlmaLinux OS ${RELEASE_VER}-${TYPE} Docker" \
                  --releasever "${RELEASE_VER}" \
                  --resultdir "${OUTPUT_DIR}"


cat << EOF > "${OUTPUT_DIR}/Dockerfile"
FROM scratch
ADD ${IMAGE_NAME} /

CMD ["/bin/bash"]
EOF

save_logs "${OUTPUT_DIR}/logs"
