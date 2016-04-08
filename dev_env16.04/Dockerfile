FROM ubuntu:16.04
RUN apt-get -y update && apt-get install -y \
    build-essential \
    ccache \
    clang \
    clang-format \
    cmake \
    curl \
    git \
    libavcodec-dev \
    libavformat-dev \
    libdc1394-22-dev \
    libeigen3-dev \
    libgtk2.0-dev \
    libjasper-dev \
    libjpeg-dev \
    libpng-dev \
    libswscale-dev \
    libtbb-dev \
    libtbb2 \
    libtiff-dev \
    pkg-config \
    unzip \
    && rm -rf /var/lib/apt/lists/*

COPY third_party/CMakeLists.txt third_party/build.sh /tmp/

COPY third_party/gflags.cmake /tmp/external.cmake
RUN /tmp/build.sh

COPY third_party/glog.cmake /tmp/external.cmake
RUN /tmp/build.sh

COPY third_party/googletest.cmake /tmp/external.cmake
RUN /tmp/build.sh

COPY third_party/protobuf.cmake /tmp/external.cmake
RUN /tmp/build.sh

COPY third_party/opencv.cmake /tmp/external.cmake
RUN /tmp/build.sh

COPY third_party/boost.cmake /tmp/external.cmake
RUN /tmp/build.sh

COPY third_party/ceres.cmake /tmp/external.cmake
RUN /tmp/build.sh
