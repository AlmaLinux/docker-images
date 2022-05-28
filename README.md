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

Almalinux 9.0 GA Release. Following packages update since `beta1` relase.

- almalinux-gpg-keys upgraded from 9.0-1.el9 to 9.0-3.el9
- almalinux-release- upgraded from 9.0-1.el9 to 9.0-3.el9
- almalinux-repos upgraded from 9.0-1.el9 to 9.0-3.el9
- audit-libs upgraded from 3.0.7-101.el9_0.1 to 3.0.7-101.el9_0.2
- crypto-policies upgraded from 20220223-1.git5203b41.el9 to 20220223-1.git5203b41.el9_0.1
- crypto-policies-scripts upgraded from 20220223-1.git5203b41.el9 to 20220223-1.git5203b41.el9_0.1
- cryptsetup-libs upgraded from 2.4.3-1.el9 to 2.4.3-4.el9
- cyrus-sasl-lib upgraded from 2.1.27-19.el9 to 2.1.27-20.el9
- dmidecode upgraded from 3.3-6.el9 to 3.3-7.el9
- gnutls upgraded from 3.7.3-5.el9 to 3.7.3-9.el9
- gzip upgraded from 1.10-8.el9 1.10-9.el9_0
- libblkid upgraded from 2.37.2-1.el9 to 2.37.4-3.el9
- ibcap-ng upgraded from 0.8.2-6.el9 to 0.8.2-7.el9
- libfdisk upgraded from 2.37.2-1.el9 to 2.37.4-3.el9
- libgcc upgraded from 11.2.1-6.1.el9.alma to 11.2.1-9.4.el9.alma
- libgomp upgraded from 11.2.1-6.1.el9.alma to 11.2.1-9.4.el9.alma
- libmount upgraded from 2.37.2-1.el9 to 2.37.4-3.el9
- libreport upgraded from filesystem-2.15.2-5.el9 to 2.15.2-6.el9.alma
- libsmartcols upgraded from 2.37.2-1.el9 to 2.37.4-3.el9
- libstdc++ upgraded from 11.2.1-6.1.el9.alma to 11.2.1-9.4.el9.alma
- libusbx upgraded from 1.0.24-4.el9 to 1.0.25-2.el9
- libuser upgraded from 0.63-10.el9 to 0.63-8.el9
- libuuid upgraded from 2.37.2-1.el9 to 2.37.4-3.el9
- libxml2 upgraded from 2.9.12-4.el9 to 2.9.13-1.el9
- openssl upgraded from 3.0.1-20.el9_0 3.0.1-23.el9_0
- openssl upgraded from libs-3.0.1-20.el9_0 3.0.1-23.el9_0
- python3-rpm upgraded from 4.16.1.3-11.el9 to 4.16.1.3-12.el9_0
- rpm upgraded from 4.16.1.3-11.el9 to 4.16.1.3-12.el9_0
- rpm-build-libs upgraded from 4.16.1.3-11.el9 to 4.16.1.3-12.el9_0
- rpm-libs upgraded from 4.16.1.3-11.el9 to 4.16.1.3-12.el9_0
- rpm-sign-libs upgraded from 4.16.1.3-11.el9 to 4.16.1.3-12.el9_0
- systemd-250 upgraded from 3.el9 to 250-6.el9_0
- systemd-libs upgraded from 250-3.el9 to 250-6.el9_0
- systemd-pam upgraded from 250-3.el9 to 250-6.el9_0
- systemd-rpm-macros upgraded from 250-3.el9 to 250-6.el9_0
- usermode upgraded from 1.114-2.el9 to 1.114-4.el9
- util-linux upgraded from 2.37.2-1.el9 to 2.37.4-3.el9
- util-linux-core upgraded from 2.37.2-1.el9 to 2.37.4-3.el9
- vim-minimal upgraded from 8.2.2637-13.el9 to 8.2.2637-15.el9

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