#!/bin/bash -ex
mkdir -p build
cd build
cmake \
    -DOPENCV_AI_PREFIX_PATH=/opt/opencv_ai \
    -DCMAKE_CXX_COMPILER=clang++ \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    ..
make -j
rm -rf /tmp/build /tmp/third_party
