# AlmaLinux Docker Images

This project contains sources and tools for building [Official AlmaLinux Docker](https://hub.docker.com/_/almalinux)
images.

## Build Requirements

Docker images are created using AlmaLinux `rootfs` images. These images can be created from customized `kickstart` sources.

### Using an AlmaLinux system

You need an **AlmaLinux system** with following RPM packages installed to run the `build.sh` script to create `rootfs` file.

* anaconda-tui
* lorax
* subscription-manager (make sure the `rhsm` service is running, see [rhbz#1872902](https://bugzilla.redhat.com/show_bug.cgi?id=1872902))
* jq

```sh
./build.sh -h
Generates an AlmaLinux OS rootfs and Dockerfile
Usage: build.sh [OPTION]...
  -h        show this message and exit
  -o        output directory path. Default is "./result"
  -t        build type. Possible options are base, default, init, micro and minimal
  -v        AlmaLinux major release version, 8 or 9, Default value is 8
}

```

Use command below to create `default` docker files for `almalinux:8`container image

```sh
./build.sh -o default -t default -v 8
```

Use command below to create `minimal` docker files for `almalinux:minimal`container image

```sh
./build.sh -o minimal -t minimal -v 8
```

Use command below to create `base` docker files for `almalinux:base`container image

```sh
./build.sh -o base -t base -v 8
```

Use command below to create `micro` docker files for `almalinux:micro`container image

```sh
./build.sh -o micro -t micro -v 8
```

Use command below to create `init` docker files for `almalinux:init`container image

```sh
./build.sh -o init -t init -v 8
```

Use `sudo ./build-all-8.sh` for building all images of Almalinux 8. Use `sudo ./build-all-9.sh` for building all images of Almalinux 9.

### Known issues

You may see the following message in the output:

```sh
2021-02-05 20:28:10,554: Error in atexit._run_exitfuncs:
2021-02-05 20:28:10,555: Traceback (most recent call last):
2021-02-05 20:28:10,555: File "/usr/lib/python3.6/site-packages/dasbus/client/handler.py", line 477, in _get_method_reply
2021-02-05 20:28:10,557: return self._handle_method_error(error)
2021-02-05 20:28:10,559: File "/usr/lib/python3.6/site-packages/dasbus/client/handler.py", line 497, in _handle_method_error
2021-02-05 20:28:10,560: raise exception from None
2021-02-05 20:28:10,562: dasbus.error.DBusError: umount of /mnt/sysimage/run failed (32)
```

This happens because we need to unmount `/run` in the kickstart file.
It doesn't affect the result, see
[rhbz#1904008](https://bugzilla.redhat.com/show_bug.cgi?id=1904008) for
details.

### Using Docker

You need a system with docker installed for this approach. This uses `almalinux/ks2rootfs` [build utility](https://github.com/AlmaLinux/ks2rootfs) using docker.

Use command below to create `default` docker files

```sh
docker run --rm --privileged -v "$PWD:/build:z" \
    -e KICKSTART_FILE=kickstarts/almalinux-8-default.ks \
    -e IMAGE_NAME=almalinux-8-docker-default.x86_64.tar.gz \
    -e OUTPUT_DIR=default \
    -e BUILD_TYPE=default \
    almalinux/ks2rootfs
```

Use command below to create `base` docker files

```sh
docker run --rm --privileged -v "$PWD:/build:z" \
    -e KICKSTART_FILE=kickstarts/almalinux-8-base.ks \
    -e IMAGE_NAME=almalinux-8-docker-base.x86_64.tar.gz \
    -e OUTPUT_DIR=base \
    -e BUILD_TYPE=base \
    almalinux/ks2rootfs
```

Use command below to create `init` docker files

```sh
docker run --rm --privileged -v "$PWD:/build:z" \
    -e KICKSTART_FILE=kickstarts/almalinux-8-init.ks \
    -e IMAGE_NAME=almalinux-8-docker-init.x86_64.tar.gz \
    -e OUTPUT_DIR=init \
    -e BUILD_TYPE=init \
    almalinux/ks2rootfs
```

Please make note docker utility cannot be used to generate `micro` and `minimal` packages. Work in progress to resolve it.

## References

* Docker documentaion - [Create a base image](https://docs.docker.com/develop/develop-images/baseimages/)
* Opencontainers [image-spec annotations/labels](https://github.com/opencontainers/image-spec/blob/master/annotations.md)
* RedHat [Kickstart Reference guide](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/system_design_guide/kickstart-script-file-format-reference_system-design-guide)

## License

Licensed under the MIT license, see the [LICENSE](LICENSE) file for details.
