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

AlmaLinux 8 now support `s390x` platform architecture...!

Additional changes in this build ...

- `bash` changed from 4.4.20-3.el8 to 4.4.20-4.el8_6
- `curl` changed from 7.61.1-22.el8_6.3 to 7.61.1-22.el8_6.4
- `dbus` changed from 1.12.8-18.el8 to 1.12.8-18.el8_6.1
- `dbus-common` changed from 1.12.8-18.el8 to 1.12.8-18.el8_6.1
- `dbus-daemon` changed from 1.12.8-18.el8 to 1.12.8-18.el8_6.1
- `dbus-libs` changed from 1.12.8-18.el8 to 1.12.8-18.el8_6.1
- `dbus-tools` changed from 1.12.8-18.el8 to 1.12.8-18.el8_6.1
- `device-mapper` changed from 1.02.181-3.el8 to 1.02.181-3.el8_6.2
- `device-mapper-libs` changed from 1.02.181-3.el8 to 1.02.181-3.el8_6.2
- `libcurl-minimal` changed from 7.61.1-22.el8_6.3 to 7.61.1-22.el8_6.4
- `libdnf` changed from 0.63.0-8.el8.alma to 0.63.0-8.1.el8_6.alma
- `openssl-libs` changed from 1.1.1k-6.el8_5 to 1.1.1k-7.el8_6
- `pcre2` changed from 10.32-2.el8 to 10.32-3.el8_6
- `python3-hawkey` changed from 0.63.0-8.el8.alma to 0.63.0-8.1.el8_6.alma
- `python3-libdnf` changed from 0.63.0-8.el8.alma to 0.63.0-8.1.el8_6.alma
- `systemd` changed from 239-58.el8 to 239-58.el8_6.4
- `systemd-libs` changed from 239-58.el8 to 239-58.el8_6.4
- `systemd-pam` changed from 239-58.el8 to 239-58.el8_6.4
- `tzdata` changed from 2022a-1.el8 to 2022c-1.el8
- `vim-minimal` changed from 8.0.1763-19.el8_6.2 to 8.0.1763-19.el8_6.4
    
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
