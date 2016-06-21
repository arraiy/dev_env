ExternalProject_Add(protobuf
  PREFIX ${build_prefix}
  DEPENDS glog googletest gflags
  URL https://github.com/opencv-ai/protobuf/archive/89719f07a35b.zip
  CONFIGURE_COMMAND cmake ${build_prefix}/src/protobuf/cmake
  -DCMAKE_PREFIX_PATH=${prefix}
  -DCMAKE_INSTALL_PREFIX=${prefix}
  -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
  -DCMAKE_CXX_COMPILER=clang++
  -DCMAKE_C_COMPILER=clang
  -Dprotobuf_BUILD_TESTS=OFF
  -Dprotobuf_BUILD_SHARED_LIBS=OFF
  -Dprotobuf_MSVC_STATIC_RUNTIME=ON
  INSTALL_DIR ${prefix}
  )
