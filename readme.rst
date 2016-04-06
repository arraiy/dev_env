dev_env
+++++++

A docker based development environment for opencv.ai.

dev_env uses containers to encapsulate the toolchains and third party
depenedencies required to build opencv.ai projects.

Some assumptions:

- Using ubuntu for your host machine.
- The main development environment is based on ubuntu 16.04
- Targeting clang and c++14 for c++ develelopment.
- All build commands are run through the container.
- All build artifacts are run in the container, or on a compatible
  host.
- Where possible we try to use debian binary packages; however for c++ this becomes a burden when tracking newer compilers.

Todo:

- Add support for arm.
- Add a bare-metal configuration.

Container layout
----------------

Its just a normal FHS, most things are installed through ``apt-get``.

For custom built dependencies, these live in ``/opt/opencv_ai`` which
itself is an FHS.  This makes it just work out of the box with
CMAKE_PREFIX_PATH.

When using the ``cv_run`` alias, the parent directory of dev_env gets
mounted in the container, with the same path.

Usage
-----

Pre-requisite, install docker. Follow these instructions::

  https://docs.docker.com/engine/installation/linux/ubuntulinux/

To use the development container, clone it to some location that you
want to mount on both your host and inside of the container. I use
``~/code`` in these examples::

  mkdir ~/code && cd ~/code && git clone https://github.com/opencv-ai/dev_env.git

Souce the path.bash.inc to get some aliases that make it easier to use
the container::

  . ~/code/dev_env/path.bash.inc


Initialize a cmake project, with clang::

  mkdir -p ~/code/sample-build
  cd ~/code/sample-build
  cv_cmake_init ~/code/dev_env/sample


To make::

  cv_make

To run the executable::

  cv_run ./messages_test

To test::

  cv_run ctest

To reconfigure::

  cv_cmake .


build image
-----------

To build::

  cd ubuntu16.04
  docker build -t opencvai/dev_env:16.04

To push::

  docker push opencvai/dev_env:16.04


docker notes
------------
Useful links:

 - https://docs.docker.com/engine/examples/apt-cacher-ng/
 - https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/
