#!/bin/sh
test_path=${1}
docker run --rm -t \
  -v $PWD:/code \
  -v /var/run/docker.sock:/var/run/docker.sock:rw \
  srbala/testinfra:docker
