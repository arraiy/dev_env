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

COPY third_party /tmp/third_party
RUN cd /tmp/third_party/ && cmake -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_C_COMPILER=clang . && make -j7 && cd / && rm -rf /tmp/*
