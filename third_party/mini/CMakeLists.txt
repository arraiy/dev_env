cmake_minimum_required(VERSION 2.8)
project(opencv_ai_third_party_mini)
include(ExternalProject)

set(prefix ${OPENCV_AI_PREFIX_PATH})
set(build_prefix ${CMAKE_BINARY_DIR}/external)

include(./boost.cmake)
include(./gflags.cmake)
include(./glog.cmake)
include(./googletest.cmake)
include(./protobuf.cmake)
