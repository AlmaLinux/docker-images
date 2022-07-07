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

Almalinux 9.0 GA Release. Following packages update since previous relase.

- almalinux-gpg-keys upgraded from 9.0-3.el9 to 9.0-4.el9
- almalinux-release upgraded from 9.0-3.el9 to  9.0-4.el9
- almalinux-repos upgraded from 9.0-3.el9 to 9.0-4.el9
- curl-minimal upgraded from 7.76.1-14.el9 to 7.76.1-1  
- expat upgraded from 2.2.10-12.el9_0 to 2.2.10-12.el9_0.2
- libarchive upgraded from 3.5.3-1.el9 to 3.5.3-2.el9_0
- libcurl-minimal upgraded from 7.76.1-14.el9 to 7.76.1-14.el9_0.4
- libgcrypt upgraded from 1.10.0-2.el9 to 10.37-5.el9_0 
- libxml2 upgraded from 2.9.13-1.el9 to 2.9.13-1.el9_0.1
- pcre2 upgraded from 10.37-3.el9.1 to 10.37-5.el9_0
- pcre2-syntax upgraded from 10.37-3.el9.1 to 10.37-5.el9_0
- vim-minimal upgraded from 8.2.2637-15.el9 8.2.2637-16.el9_0.2
- xz upgraded from 5.2.5-7.el9 to 5.2.5-8.el9_0
- xz-libs upgraded from 5.2.5-7.el9 to 5.2.5-8.el9_0

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