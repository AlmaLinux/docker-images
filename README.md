# AlmaLinux Docker Images

[AlmaLinux OS](https://almalinux.org/) is an Open Source and forever-free
enterprise Linux distribution, governed and driven by the community, focused
on long-term stability and a robust production-grade platform. AlmaLinux OS
is a 1:1 binary compatible with RHEL® 8 and it was founded by the team behind
the well-established [CloudLinux OS](https://www.cloudlinux.com/all-products/product-overview/cloudlinuxos).

This project contains sources and tools for building [Official AlmaLinux Docker](https://hub.docker.com/_/almalinux)
images.

## Image tags and versions

The `almalinux:latest` tag always points to the most recent version available.

## Change Log

Changes in this build ...

Almalinux PowerPC arch support and upgraded 8.5-4 release

- added `ppcle64` arch support in docker images

### `almalinux:latest` image packages updates

- almalinux-release upgraded from 8.5-2.el8 to 8.5-4.el8
- binutils upgraded from 2.30-108.el8 to 2.30-108.el8_5.1
- cryptsetup-libs upgraded from 2.3.3-4.el8 to cryptsetup-libs-2.3.3-4.el8_5.1
- cyrus-sasl-lib upgraded from 2.1.27-5.el8 to cyrus-sasl-lib-2.1.27-6.el8_5
- langpacks-en-1.0-12.el8 added
- libgcc upgraded from 8.5.0-3.el8.alma to 8.5.0-4.el8_5.alma
- libstdc++ upgraded from 8.5.0-3.el8.alma to 8.5.0-4.el8_5.alma
- openssl-libs upgraded from 1.1.1k-4.el8 to 1.1.1k-5.el8_5
- platform-python upgraded from 3.6.8-41.el8 to 3.6.8-41.el8.alma
- python3-libs upgraded from 3.6.8-41.el8 to 3.6.8-41.el8.alma
- python3-rpm upgraded from 4.14.3-19.el8 to 4.14.3-19.el8_5.2
- rpm upgraded from 4.14.3-19.el8 to 4.14.3-19.el8_5.2
- rpm-build-libs upgraded from 4.14.3-19.el8 to 4.14.3-19.el8_5.2
- rpm-libs upgraded from 4.14.3-19.el8 to 4.14.3-19.el8_5.2
- systemd upgraded from 239-51.el8 to 239-51.el8_5.3
- systemd-libs upgraded from 239-51.el8 to 239-51.el8_5.3
- systemd-pam upgraded from 239-51.el8 to 239-51.el8_5.3
- vim-minimal upgraded from 8.0.1763-16.el8 to 8.0.1763-16.el8_5.4

### `almalinux:minmal` image packages updates

- almalinux-release upgraded from 8.5-2.el8 to 8.5-4.el8
- cyrus-sasl-lib upgraded from 2.1.27-5.el8 to 2.1.27-6.el8_5
- langpacks-en 1.0-12.el8 added
- libgcc upgraded from 8.5.0-3.el8.alma to 8.5.0-4.el8_5.alma
- libstdc++ upgraded from 8.5.0-3.el8.alma to 8.5.0-4.el8_5.alma
- openssl-libs upgraded from 1.1.1k-4.el8 to 1.1.1k-5.el8_5
- rpm upgraded from 4.14.3-19.el8 to 4.14.3-19.el8_5
- rpm-libs upgraded from 4.14.3-19.el8 to 4.14.3-19.el8_5
- systemd-libs upgraded from 239-51.el8 to 239-51.el8_5.3

## License

View [license information](https://almalinux.org/legal/licensing-policy/) for
the software contained in this image.

As with all Docker images, these likely also contain other software which may
be under other licenses (such as Bash, etc from the base distribution, along
with any direct or indirect dependencies of the primary software being
contained).

As for any pre-built image usage, it is the image user's responsibility to
ensure that any use of this image complies with any relevant licenses for all
software contained within.

Red Hat and CentOS are trademarks or registered trademarks of Red Hat, Inc.
or its subsidiaries in the United States and other countries.
AlmaLinux OS is not affiliated with, endorsed by or sponsored by Red Hat or
the CentOS Project.