cmake_minimum_required(VERSION 3.0)
project(opencv_ai_sample_project)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Werror -Wno-unused-parameter -std=c++14")

include(CTest)
enable_testing()

find_package(GTest REQUIRED)
find_package(glog REQUIRED)
find_package(Eigen3 REQUIRED)
find_package(Protobuf REQUIRED)

include_directories(${EIGEN3_INCLUDE_DIR} SYSTEM)
include_directories(${GTEST_INCLUDE_DIRS} SYSTEM)
include_directories(${GLOG_INCLUDE_DIRS} SYSTEM)
include_directories(${PROTOBUF_INCLUDE_DIRS} SYSTEM)

# for protobuf generated code
include_directories(${CMAKE_CURRENT_BINARY_DIR} SYSTEM)

protobuf_generate_cpp(PROTO_SRCS PROTO_HDRS
  messages.proto)

add_library(messages ${PROTO_SRCS} ${PROTO_HDRS})
target_link_libraries(messages ${PROTOBUF_LIBRARIES})

add_executable(smoke_test smoke_test.cc)
target_link_libraries(smoke_test messages GTest::GTest GTest::Main ${glog_LIBRARY})

GTEST_ADD_TESTS(smoke_test "" AUTO)
