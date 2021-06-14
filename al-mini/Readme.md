# AlmaLinux Minimal Image

Experimental minimal container image for Alma linux.

## Local Container Build

Building container image locally using docker

```sh
docker build -t almalinux:8-minimal - < Dockerfile
```

## Comparing AlmaLinux Minimal Vs UBI Minimal

Use following commands to compare AlmaLinux Minimal image with UBI minimal.

### Get UBI Minimal

Use docker pull `registry.access.redhat.com/ubi8/ubi-minimal:8.4` for image package verifications.

```sh
docker pull registry.access.redhat.com/ubi8/ubi-minimal:8.4
```

### UBI Minimal Packages

First run UBI Mimimal continer, then use `rpm -qa` command to get list of packages, sort and store it locally for later comparision.

```sh
$ docker run --rm -it -v $PWD:/mydata registry.access.redhat.com/ubi8/ubi-minimal:8.4
[root@70c08cf3c6a0 /]# rpm -qa | sort > /mydata/ubi-mini.txt
[root@70c08cf3c6a0 /]# exit
```

### AlmaLinux Minimal Packages

Repeat `rpm` and `sort` commands in AlmaLinux contianer to get packages to compare in next step.

```sh
$ docker run --rm -it -v $PWD:/mydata almalinux:8-minimal 
[root@b0f53298e48c /]# rpm -qa | sort > /mydata/al-mini.txt
[root@b0f53298e48c /]# exit
```

### Diff Alma vs UBI

Image packages exported from previous steps are available in current working directory

```sh
$ ls -al *mini.txt
-rw-r--r--  1 srbala  staff  3071 Jun 14 18:45 al-mini.txt
-rw-r--r--  1 srbala  staff  3111 Jun 14 18:43 ubi-mini.txt
```

Someof the packages from AlmoLinux contains `.alma`, clean it prior to compare

```sh
sed -i 's/.alma././g' al-mini.txt
```

Use following in OSX to avoid command error

```sh
sed -i '' 's/.alma././g' al-mini.txt
```

Now compare using `diff` command.

```sh
$ diff al-mini.txt ubi-mini.txt 
1d0
< almalinux-release-8.4-2.el8.x86_64
26c25,26
< gpg-pubkey-3abb34f8-5ffd890e
---
> gpg-pubkey-d4082792-5b32db75
> gpg-pubkey-fd431d51-4ae0493b
59a60
> librhsm-0.0.3-4.el8.x86_64
93a95
> redhat-release-8.4-0.6.el8.x86_64
```

Difference in package are acceptable, since they are specific to package/vendor.

