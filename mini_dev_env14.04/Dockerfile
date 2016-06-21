FROM ubuntu:14.04
RUN apt-get -y update && \
    apt-get install -y \
    python-software-properties \
    software-properties-common && \
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
    unzip \
    && rm -rf /var/lib/apt/lists/*

ADD third_party/build.sh /tmp/third_party/build.sh
ADD third_party/mini /tmp/third_party

RUN cd /tmp/third_party && PATH=/usr/lib/llvm-3.6/bin:$PATH ./build.sh
