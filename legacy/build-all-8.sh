#!/bin/bash
# description: Build all docker images (all-in-one).
# license: MIT.

set -euo pipefail

./build.sh -o default -t default -v 8
./build.sh -o minimal -t minimal -v 8
./build.sh -o micro -t micro -v 8
./build.sh -o base -t base -v 8
./build.sh -o init -t init -v 8
