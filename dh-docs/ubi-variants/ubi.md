# RedHat UBI Images - Scripts and notes

Dockeriles and links to RedHat UBI images for reference.

[redhat/ubi8](https://catalog.redhat.com/software/containers/ubi8/5c647760bed8bd28d0e38f9f?container-tabs=dockerfile)

```Dockerfile
FROM koji/image-build

LABEL maintainer="Red Hat, Inc."

LABEL com.redhat.component="ubi8-container" \
      name="ubi8" \
      version="8.4"

#label for EULA
LABEL com.redhat.license_terms="https://www.redhat.com/en/about/red-hat-end-user-license-agreements#UBI"

#labels for container catalog
LABEL summary="Provides the latest release of Red Hat Universal Base Image 8."
LABEL description="The Universal Base Image is designed and engineered to be the base layer for all of your containerized applications, middleware and utilities. This base image is freely redistributable, but Red Hat only supports Red Hat technologies through subscriptions for Red Hat products. This image is maintained by Red Hat and updated regularly."
LABEL io.k8s.display-name="Red Hat Universal Base Image 8"
LABEL io.openshift.expose-services=""
LABEL io.openshift.tags="base rhel8"

ENV container oci
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

CMD ["/bin/bash"]

RUN rm -rf /var/log/*
#rhbz 1609043
RUN mkdir -p /var/log/rhsm
```

[redhat/ubi8-minimal](https://catalog.redhat.com/software/containers/ubi8/ubi-minimal/5c359a62bed8bd75a2c3fba8?container-tabs=dockerfile)

```Dockerfile
FROM koji/image-build

LABEL maintainer="Red Hat, Inc."

LABEL com.redhat.component="ubi8-minimal-container" \
      name="ubi8-minimal" \
      version="8.4"

#label for EULA
LABEL com.redhat.license_terms="https://www.redhat.com/en/about/red-hat-end-user-license-agreements#UBI"

#labels for container catalog
LABEL summary="Provides the latest release of the minimal Red Hat Universal Base Image 8."
LABEL description="The Universal Base Image Minimal is a stripped down image that uses microdnf as a package manager. This base image is freely redistributable, but Red Hat only supports Red Hat technologies through subscriptions for Red Hat products. This image is maintained by Red Hat and updated regularly."
LABEL io.k8s.display-name="Red Hat Universal Base Image 8 Minimal"
LABEL io.openshift.expose-services=""
LABEL io.openshift.tags="minimal rhel8"

ENV container oci
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

CMD ["/bin/bash"]

RUN rm -rf /var/log/*
```

[redhat/ubi8-micro](https://catalog.redhat.com/software/containers/ubi8/ubi-micro/5ff3f50a831939b08d1b832a?container-tabs=dockerfile)

```Dockerfile
FROM registry.access.redhat.com/ubi8/ubi AS ubi-micro-build
RUN mkdir -p /mnt/rootfs
RUN yum install --installroot /mnt/rootfs coreutils-single glibc-minimal-langpack --releasever 8 --setopt install_weak_deps=false --nodocs -y; yum --installroot /mnt/rootfs clean all
RUN rm -rf /mnt/rootfs/var/cache/* /mnt/rootfs/var/log/dnf* /mnt/rootfs/var/log/yum.*

FROM scratch
LABEL maintainer="Red Hat, Inc."

LABEL com.redhat.component="ubi8-micro-container"
LABEL name="ubi8/ubi-micro"
LABEL version="8.4"

#label for EULA
LABEL com.redhat.license_terms="https://www.redhat.com/en/about/red-hat-end-user-license-agreements#UBI"

#labels for container catalog
LABEL summary="ubi8 micro image"
LABEL description="Very small image which doesn't install the package manager."
LABEL io.k8s.display-name="Ubi8-micro"
LABEL io.openshift.expose-services=""

COPY --from=ubi-micro-build /mnt/rootfs/ /
COPY --from=ubi-micro-build /etc/yum.repos.d/ubi.repo /etc/yum.repos.d/ubi.repo
CMD /bin/sh
```

[redhat/ubi8-init](https://catalog.redhat.com/software/containers/ubi8/ubi-init/5c359b97d70cc534b3a378c8?container-tabs=dockerfile)

```Dockerfile
FROM registry.stage.redhat.io/ubi8/ubi:8.4
LABEL maintainer="Red Hat, Inc."

LABEL com.redhat.component="ubi8-init-container"
LABEL com.redhat.license_terms="https://www.redhat.com/en/about/red-hat-end-user-license-agreements#UBI"
LABEL name="ubi8/ubi8-init"
LABEL version="8.4"

LABEL summary="Provides the latest release of the Red Hat Universal Base Image 8 Init for multi-service containers."
LABEL description="The Universal Base Image Init is designed is designed to run an init system as PID 1 for running multi-services inside a container. This base image is freely redistributable, but Red Hat only supports Red Hat technologies through subscriptions for Red Hat products. This image is maintained by Red Hat and updated regularly."
LABEL io.k8s.display-name="Red Hat Universal Base Image 8 Init"
LABEL io.openshift.expose-services=""
LABEL usage="Do not use directly. Use as a base image for daemons. Install chosen packages and 'systemctl enable' them."

CMD ["/sbin/init"]

STOPSIGNAL SIGRTMIN+3

#mask systemd-machine-id-commit.service - partial fix for https://bugzilla.redhat.com/show_bug.cgi?id=1472439
RUN systemctl mask systemd-remount-fs.service dev-hugepages.mount sys-fs-fuse-connections.mount systemd-logind.service getty.target console-getty.service systemd-udev-trigger.service systemd-udevd.service systemd-random-seed.service systemd-machine-id-commit.service

RUN dnf -y install procps-ng && dnf clean all
```

[rhel8/support-tools](https://catalog.redhat.com/software/containers/rhel8/support-tools/5ba3eaf9bed8bd6ee819b78b?container-tabs=dockerfile)

```Dockerfile
FROM registry.stage.redhat.io/ubi8/ubi:8.4

LABEL com.redhat.component="support-tools-container"
LABEL name="rhel8/support-tools"
LABEL version="8.4"
LABEL maintainer="Red Hat, Inc."
LABEL usage="podman container runlabel RUN rhel8/support-tools"

LABEL run="podman run -it --name NAME --privileged --ipc=host --net=host --pid=host -e HOST=/host -e NAME=NAME -e IMAGE=IMAGE -v /run:/run -v /var/log:/var/log -v /etc/machine-id:/etc/machine-id -v /etc/localtime:/etc/localtime -v /:/host IMAGE"

#labels for container catalog
LABEL summary="A set of tools to analyze the host system."
LABEL description="The Red Hat Enterprise Linux Support Tools image contains tools to analyze the host system including sosreport and sos-collector"
LABEL io.k8s.description="The Red Hat Enterprise Linux Support Tools image contains tools to analyze the host system including sosreport and sos-collector"
LABEL io.k8s.display-name="Red Hat Enterprise Linux Support Tools"
LABEL io.openshift.tags="sosreport, support"
LABEL io.openshift.expose-services=""


RUN INSTALL_PKGS="sos redhat-support-tool vim-minimal tcpdump mtr strace telnet procps-ng" && \
    yum -y install $INSTALL_PKGS && \
    rpm -V --nosize --nofiledigest --nomtime $INSTALL_PKGS && \
    yum clean all && \
    rm -rf /usr/local/man

CMD ["/usr/bin/bash"]
```
