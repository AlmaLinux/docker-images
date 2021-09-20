# Quick reference

-	**Maintained by**: [The AlmaLinux OS Foundation](%%GITHUB-REPO%%) [Cloud Special integerest group(SIG)](https://wiki.almalinux.org/sigs/Cloud.html)

-	**Where to get help**: [the Docker Community Forums](https://forums.docker.com/), [the Docker Community Slack](https://dockr.ly/slack), or [Stack Overflow](https://stackoverflow.com/search?tab=newest&q=docker)

# Supported tags and respective `Dockerfile` links

-	[`latest`, `8`, `8.4`](https://github.com/AlmaLinux/docker-images/blob/226a6650f4713fa050b1eec92dd4b6e974493e5c/Dockerfile)
-	[`minimal`, `8-minimal`, `8.4-minimal`, `almalinux/8-minimal`](https://github.com/AlmaLinux/docker-images/blob/62c988b53a408c9d1124cc4a17b0f471ce716b73/Dockerfile)
-	[`almalinux/8.4-base`](https://github.com/AlmaLinux/docker-images/blob/ad28b9b6ad3672c86857d6320cc8dd41d5ca3c66/Dockerfile)
-	[`almalinux/8.4-init`](https://github.com/AlmaLinux/docker-images/blob/cf3a890a339807ad121bc83ea613b597330a6e89/Dockerfile)
-	[`almalinux/8.4-micro`](https://github.com/AlmaLinux/docker-images/blob/8221e72561dc5d9ffd3e01664f47deeeca2c4678/Dockerfile)

# Quick reference (cont.)

-	**Where to file issues**:  
	[https://bugs.almalinux.org](https://bugs.almalinux.org) or [GitHub](https://github.com/AlmaLinux/docker-images/issues)

-	**Supported architectures**: ([more info](https://github.com/docker-library/official-images#architectures-other-than-amd64))  
	[`amd64`](https://hub.docker.com/r/amd64/almalinux/), [`arm64v8`](https://hub.docker.com/r/arm64v8/almalinux/), [`almalinux/amd64`](https://hub.docker.com/r/almalinux/amd64/), [`almalinux/arm64v8`](https://hub.docker.com/r/almalinux/arm64v8/)

-	**Published image artifact details**:  
	[repo-info repo's `repos/almalinux/` directory](https://github.com/docker-library/repo-info/blob/master/repos/almalinux) ([history](https://github.com/docker-library/repo-info/commits/master/repos/almalinux))  
	(image metadata, transfer size, etc)

-	**Image updates**:  
	[official-images repo's `library/almalinux` label](https://github.com/docker-library/official-images/issues?q=label%3Alibrary%2Falmalinux)  
	[official-images repo's `library/almalinux` file](https://github.com/docker-library/official-images/blob/master/library/almalinux) ([history](https://github.com/docker-library/official-images/commits/master/library/almalinux))

-	**Source of this description**:  
	[docs repo's `almalinux/` directory](https://github.com/docker-library/docs/tree/master/almalinux) ([history](https://github.com/docker-library/docs/commits/master/almalinux))

# AlmaLinux OS

[**`AlmaLinux OS`**](https://almalinux.org/) is an Open Source and forever-free enterprise Linux distribution, governed and driven by the community, focused on long-term stability and a robust production-grade platform. AlmaLinux OS is 1:1 binary compatible with RHEL® 8 and it was founded by the team behind the well-established [**`CloudLinux OS`**](https://www.cloudlinux.com/all-products/product-overview/cloudlinuxos).

![logo](https://raw.githubusercontent.com/docker-library/docs/23547f3e976bc000d1a01a47241000f72aec9a40/almalinux/logo.png)

## About this image

[AlmaLinux OS](https://almalinux.org/) images can be use with all [OCI complaint](https://opencontainers.org/) container runtime environments like Docker, Podman and Kubernetes and serve as drop-in replacemenets for `centos` images as it reaches [End of Life](https://centos.org/centos-linux-eol/).

### Platform image, `latest` tag

The default (platform) image is a general-purpose image with a full DNF stack and basic tools like bintools, find, tar, minimal-vim, etc.

The `almalinux:latest` tag will always point to the latest stable release of the default image. Major releases and minor releases are also tagged with their version (e.g. `almalinux:8` or `almalinux:8.4`).

```bash
docker pull almalinux
```

### Minimal image, `minimal` tag

The minimal image is a stripped-down image that uses the [**`microdnf`**](https://github.com/rpm-software-management/microdnf) as package manager which uses `libdnf` and hence doesn't require Python. This image is `52%` smaller in size (`37MB` download, `102MB` expanded), contains a very limited package set. It is designed for applications that come with their own dependencies bundled (e.g. GO, NodeJS, Java).

The `almalinux:minimal` tag always points to the most recent version of the minimal image. Tags for major (e.g. `almalinux:8-minimal`) and minor (e.g. `almalinux:8.4-minimal`) releases are also available.

```bash
docker pull almalinux:minimal
```

This minimal image has an additional tag `almalinux/8-minimal`, its a mirror of `almalinux:minimal`, created to be consistent with other `UBI` variants. So, `docker pull almalinux/8-minimal` image is same as `docker pull almalinux:minimal`

### Base image, `almalinux/8-base` tag

The AlmaLinux Base Image is designed to be a base for your containerized applications, middleware and utilities. Base Image includes some helpful OS tools like find, tar, vi, etc., and a full DNF stack. The Image has some differences in a package set than the default(platform) image.

```bash
docker pull almalinux/8-base
```

### Init image, `almalinux/8-init` tag

The AlmaLinux init image extends base image, designed to run an init system as PID 1 for running multi-services inside a container. The systemd enabled as init system in the image

```bash
docker pull almalinux/8-init
```

### Micro image, `almalinux/8-micro` tag

The AlmaLinux micro image is a stripped down image, distributed without any package manager. Micro image uses the package manager on the underlying host to install packages, typically using Buildah, or Multi-stage builds with Podman. Micro image is `82%` smaller then `base` image, `68%` smaller then `minimal` image in size (`13MB` download, `36MB` expanded). It is designed for applications that come with their own dependencies bundled (e.g. GO, NodeJS, Java). Since this image has only very few packages, it is more secured compare to other images.

```bash
docker pull almalinux/8-micro
```

### Upgrade policy

All images for supported releases will be updated monthly or as needed for security fixes.

### How It's Made

The rootfs tarballs for this image are built using the [livemedia-creator tool](http://weldr.io/lorax/livemedia-creator.html). The build script and kickstart files are available in the [AlmaLinux/docker-images](https://github.com/AlmaLinux/docker-images) git repository.

## License

View [license information](https://almalinux.org/p/legal-notice/) for the software contained in this image.
 