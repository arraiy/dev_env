dev_env: Container Based Development Environment
++++++++++++++++++++++++++++++++++++++++++++++++

.. image:: https://travis-ci.org/opencv-ai/dev_env.svg?branch=master
    :target: https://travis-ci.org/opencv-ai/dev_env

This repository is for building the docker container based development
environment used by opencv.ai.

We use containers to encapsulate system state, such as toolchains and
third party dependencies required to build opencv.ai projects. The
benefits are:

- System dependencies are easily installed in the container using
  upstream build systems.
- The container image that developers use is same as the container
  used by the CI system.
- System dependencies can be updated atomically with a commit in a git
  repository.
- The system dependencies are explicitly tracked in code, so its hard
  to forget to update the docs.

Some notes.

- We assume that the developer or CI host is ubuntu >= 14.04.
- We are focusing on clang and c++14 for c++ development.
- We assume cmake is the build system of choice; but do not preclude
  other build systems.
- All build commands are run through the container.
- All build artifacts are run in the container, or on a compatible
  host.
- Where possible we try to use debian binary packages; however for c++
  this becomes a burden when tracking newer compilers.
- For packages which need to be built they are installed to
  ``/opt/opencv_ai`` which is an FHS root.

*TODO*:

- Add support for arm.
- Add support for gcc?
- Add a bare-metal configuration.
- Add support for tsan, asan, msan.

Container layout
----------------

It looks just a normal `FHS
<https://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard>` as most
things are installed through ``apt-get``.

For custom built dependencies, these live in ``/opt/opencv_ai`` which
itself is an FHS.  Dependencies in this directory can be found easily
by adjusting CMAKE_PREFIX_PATH.

When using the ``cv_run`` alias, the parent directory of dev_env gets
mounted in the container, with the same path.


Install
-------

To use this development environment:

- install `Docker <https://docs.docker.com/engine/installation/linux/ubuntulinux/`.
- Copy ``path.bash.inc`` and ``cv_run`` to the root of your git project.

Usage
-----

These examples walk through usage using the sample project that is
part of this git repository.  I use ``~/code`` as the root of my tree
in these examples.  First, clone this repository::

  mkdir ~/code && cd ~/code && git clone https://github.com/opencv-ai/dev_env.git

The normal flow for using the environment is to source
``path.bash.inc`` to get some aliases that make it easier to use the
container. The rest of the examples assume you have sourced it as
follows::

  . ~/code/dev_env/path.bash.inc

Initialize a cmake build directory, out of source, with a clang
toolchain using the ``cv_cmake_init`` alias::

  mkdir -p ~/code/sample-build
  cd ~/code/sample-build
  cv_cmake_init ~/code/dev_env/sample

Now To build, just run ``make`` inside of the container, with the
``cv_make`` alias::

  cd ~/code/sample-build && cv_make

To run a build executable inside of the container::

  cd ~/code/sample-build && cv_run ./messages_test

To test::

  cd ~/code/sample-build && cv_test

To run cmake::

  cd ~/code/sample-build && cv_cmake .

You can also run these things commands without sourcing
``path.bash.inc``, using the ``cv_run`` executable::

  ~/code/dev_env/cv_run make -C ~/code/sample-build

**Note** ``~/code`` is shared between the container and the host, and
 is simply the parent directory of wherever ``path.bash.inc`` lives.
 Don't try to put your build folder in another directory tree.  Also,
 ``cv_run`` and all of the aliases run from host's working directory,
 but inside of the container.


build image
-----------

To build for ubuntu 16.04::

  ./build.sh

To push::

  docker push opencvai/dev_env16.04


docker notes
------------
Useful links:

 - https://docs.docker.com/engine/examples/apt-cacher-ng/
 - https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/
