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

- device-mapper upgraded from 1.02.177-10.el8 to 1.02.177-11.el8_5
- device-mapper-libs upgraded from 1.02.177-10.el8 to1.02.177-11.el8_5
- expat- upgraded from 2.2.5-4.el8 to 2.2.5-4.el8_5.3
- glibc-2.28-164.el8 to 2.28-164.el8_5.3
- glibc-common-2.28-164.el8 to 2.28-164.el8_5.3
- glibc-minimal-langpack-2.28-164.el8 to 2.28-164.el8_5.3
- gzip upgraded from 1.9-12.el8 to 1.9-13.el8_5
- libarchive upgraded from 3.3.3-1.el8 to 3.3.3-3.el8_5
- libxml2 upgraded from 2.9.7-12.el8_5 to 2.9.7-9.el8_4.2
- openssl-libs upgraded from 1.1.1k-5.el8_5 to 1.1.1k-6.el8_5
- systemd upgraded from 239-51.el8_5.3 to 239-51.el8_5.5
- systemd-libs upgraded from 239-51.el8_5.3 to 239-51.el8_5.5
- systemd-pam upgraded from 239-51.el8_5.3 to 239-51.el8_5.5
- tzdata upgraded from 2021e-1.el8 to 2022a-1.el8
- vim-minimal upgraded from 8.0.1763-16.el8_5.13 to 8.0.1763-16.el8_5.4
- zlib upgraded from 1.2.11-17.el8 to 1.2.11-18.el8_5

### `almalinux:minmal` image packages updates

- glibc-2.28-164.el8 to 2.28-164.el8_5.3
- glibc-common-2.28-164.el8 to 2.28-164.el8_5.3
- glibc-minimal-langpack-2.28-164.el8 to 2.28-164.el8_5.3
- libarchive upgraded from 3.3.3-1.el8 to 3.3.3-3.el8_5
- libxml2 upgraded from 2.9.7-12.el8_5 to 2.9.7-9.el8_4.2
- openssl-libs upgraded from 1.1.1k-5.el8_5 to 1.1.1k-6.el8_5
- systemd-libs upgraded from 239-51.el8_5.3 to 239-51.el8_5.5
- tzdata upgraded from 2021e-1.el8 to 2022a-1.el8
- zlib upgraded from 1.2.11-17.el8 to 1.2.11-18.el8_5
  
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
