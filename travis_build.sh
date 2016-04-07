#!/bin/bash -ex
export OPENCVAI_DEV_ENV_TAG=:travis
docker build -t opencvai/dev_env16.04$OPENCVAI_DEV_ENV_TAG -f dev_env16.04/Dockerfile ./
. path.bash.inc
mkdir -p build && cd build
cv_cmake_init ../sample
cv_make
cv_test
