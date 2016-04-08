#!/bin/bash -ex
mkdir -p /tmp/build
cd /tmp/build
cmake ..
make -j7
rm -rf /tmp/build
