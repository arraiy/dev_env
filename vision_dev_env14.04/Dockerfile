FROM opencvai/mini_dev_env14.04:latest
RUN  echo 'Acquire::http { Proxy "http://172.17.0.1:3142"; };' >> /etc/apt/apt.conf.d/01proxy
RUN apt-get -y update && apt-get install -y \
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
    xorg-dev \
    && rm -rf /var/lib/apt/lists/*

ADD third_party/build.sh /tmp/third_party/build.sh
ADD third_party/vision /tmp/third_party
RUN cd /tmp/third_party && PATH=/usr/lib/llvm-3.6/bin:$PATH ./build.sh
