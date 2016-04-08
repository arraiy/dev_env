cmake_minimum_required(VERSION 2.8)
project(opencv_ai_third_party)
include(ExternalProject)

set(prefix /opt/opencv_ai)
set(build_prefix ${CMAKE_CURRENT_BINARY_DIR}/external)

include(external.cmake)
