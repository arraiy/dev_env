FROM ubuntu:14.04
RUN  echo 'Acquire::http { Proxy "http://172.17.0.1:3142"; };' >> /etc/apt/apt.conf.d/01proxy

RUN apt-get -y update && apt-get install -y \
     python-software-properties \
     software-properties-common	&& \
    add-apt-repository ppa:george-edison55/cmake-3.x -y && \
    apt-get -y update && apt-get install -y \
    build-essential \
    ccache \
    clang-3.6 \
    clang-format-3.6 \
    cmake \
    curl \
    gdb \
    git \
    libavcodec-dev \
    libavformat-dev \
    libdc1394-22-dev \
    libeigen3-dev \
    libgl1-mesa-dev \
    libglew-dev \
    libglfw-dev \
    libgtk2.0-dev \
    libjasper-dev \
    libjpeg-dev \
    libpng-dev \
    libpng12-dev \
    libswscale-dev \
    libtbb-dev \
    libtbb2 \
    libtiff-dev \
    libvtk5-dev \
    pkg-config \
    unzip \
    xorg-dev \
    && rm -rf /var/lib/apt/lists/*

ADD third_party /tmp/third_party
RUN cd /tmp/third_party && PATH=/usr/lib/llvm-3.6/bin:$PATH ./build.sh
