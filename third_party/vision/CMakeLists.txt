cmake_minimum_required(VERSION 2.8)
project(opencv_ai_third_party_vision)
include(ExternalProject)

set(prefix ${OPENCV_AI_PREFIX_PATH})
set(build_prefix ${CMAKE_BINARY_DIR}/external)

include(./glfw.cmake)
include(./ceres.cmake)
include(./opencv.cmake)
