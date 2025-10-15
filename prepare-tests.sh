#!/bin/bash

set -e
BASE_PATH="$(dirname "$(realpath $0)")"

snapcraft pack

for path in $(find test/ -name snapcraft.yaml -exec dirname {} ';'); do
  pushd "${path}"
  cp -alf $BASE_PATH/python-runtime-core26-314*.snap .
  snapcraft pack
  popd
done
