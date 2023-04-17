#!/bin/bash
# description: AlmaLinux base Docker image rootfs and Dockerfile generation
#              script.
# license: MIT.

set -euo pipefail

RELEASE_VER='8'
ARCH=$(uname -m)
OUTPUT_DIR="./result_${ARCH}"
TYPE='default'

OPTIND=1

show_usage() {
	echo -e 'Generates an AlmaLinux OS rootfs and Dockerfile\n'
	echo -e 'Usage: build.sh [OPTION]...\n'
	echo '  -h        show this message and exit'
	echo '  -o        output directory path. Default is "./result"'
	echo '  -t        image build type like "default", "init", "micro", "minimal". Default is "default"'
	echo '  -v        AlmaLinux major release version, 8 or 9'
}

save_logs() {
	local -r logs_dir="${1}"
	mkdir -p "${logs_dir}"
	if [[ -d anaconda ]]; then
		mv anaconda "${logs_dir}/"
	fi
	mv *.log "${logs_dir}/"
}

while getopts "ho:t:v:" opt; do
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
		default | init | micro | minimal | base)
			TYPE="${OPTARG}"
			;;
		*)
			echo "Error: unsupported build type ${OPTARG}" 1>&2
			exit 1
			;;
		esac
		;;
	v)
		case "${OPTARG}" in
		8 | 9)
			RELEASE_VER="${OPTARG}"
			;;
		*)
			echo "Error: unsupported version number ${OPTARG}" 1>&2
			exit 1
			;;
		esac
		;;
	*)
		exit 1
		;;
	esac
done

OUTPUT_DIR="${OUTPUT_DIR}_${RELEASE_VER}_${ARCH}-${TYPE}"

if [[ -d ${OUTPUT_DIR} ]]; then
	echo "Error: output directory ${OUTPUT_DIR} already exists, please remove it" 1>&2
	exit 1
fi

IMAGE_NAME="almalinux-${RELEASE_VER}-docker-${ARCH}-${TYPE}.tar.xz"
KS_PATH="./kickstarts/almalinux-${RELEASE_VER}-${TYPE}.ks"
DOCKER_FILE=${OUTPUT_DIR}/Dockerfile

livemedia-creator --no-virt --make-tar --ks "${KS_PATH}" \
	--image-name="${IMAGE_NAME}" \
	--project "AlmaLinux OS ${RELEASE_VER}-${TYPE} Docker" \
	--releasever "${RELEASE_VER}" \
	--resultdir "${OUTPUT_DIR}" \
	--anaconda-arg "--nosave all"

# save list of packages installed
jq .[] -r /tmp/dnf.cache/tempfiles.json | awk -F '/' '{print $5}' | sort >"${OUTPUT_DIR}"/rpm-packages-"${ARCH}"-"${TYPE}"

STARTCMD=$(
	cat <<EOF

CMD ["/bin/bash"]
EOF
)

if [ "${TYPE}" == 'init' ]; then
	STARTCMD=$(
		cat <<EOF

CMD ["/sbin/init"]

STOPSIGNAL SIGRTMIN+3
EOF
	)
fi

if [ "${TYPE}" == 'micro' ]; then
	STARTCMD=$(
		cat <<EOF

CMD ["/bin/sh"]
EOF
	)
fi

cat <<EOF >"${OUTPUT_DIR}/Dockerfile-${ARCH}-${TYPE}"
FROM scratch
ADD ${IMAGE_NAME} /
${STARTCMD}
EOF

save_logs "${OUTPUT_DIR}/logs"
