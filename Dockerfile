FROM scratch
ADD almalinux-8-docker.init.tar.xz /

CMD ["/sbin/init"]

STOPSIGNAL SIGRTMIN+3
