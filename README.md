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

### `almalinux:latest` image packages updates

- bash from 4.4.20-3.el8 to 4.4.20-4.el8_6
- dbus from 1.12.8-18.el8 to 1.12.8-18.el8_6.1
- dbus-common from 1.12.8-18.el8 to 1.12.8-18.el8_6.1
- dbus-daemon from 1.12.8-18.el8 to 1.12.8-18.el8_6.1
- dbus-libs from 1.12.8-18.el8 to 1.12.8-18.el8_6.1
- dbus-tools from 1.12.8-18.el8 to 1.12.8-18.el8_6.1
- device-mapper from 1.02.181-3.el8 to 1.02.181-3.el8_6.2
- device-mapper-libs from 1.02.181-3.el8 to 1.02.181-3.el8_6.2
- openssl-libs from 1.1.1k-6.el8_5 to 1.1.1k-7.el8_6
- pcre2 from 10.32-2.el8 to 10.32-3.el8_6
- python3-hawkey from 0.63.0-8.el8.alma to 0.63.0-8.1.el8_6.alma
- python3-libdnf from 0.63.0-8.el8.alma to 0.63.0-8.1.el8_6.alma
- systemd from 239-58.el8 to 239-58.el8_6.3
- systemd-libs from 239-58.el8 to 239-58.el8_6.3
- systemd-pam from 239-58.el8 to 239-58.el8_6.3
- vim-minimal from 8.0.1763-19.el8_6.2 to 8.0.1763-19.el8_6.4

### `almalinux:minmal` image packages updates

- bash from 4.4.20-3.el8 to 4.4.20-4.el8_6
- openssl-libs from 1.1.1k-6.el8_5 to 1.1.1k-7.el8_6
- pcre2 from 10.32-2.el8 to 10.32-3.el8_6
- systemd-libs from 239-58.el8 to 239-58.el8_6.3
  
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
