ExternalProject_Add(gflags
  PREFIX ${build_prefix}
  URL https://github.com/opencv-ai/gflags/archive/9353bca5e99dc4.zip
  CMAKE_ARGS
  -DCMAKE_PREFIX_PATH=${prefix}
  -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
  -DCMAKE_CXX_COMPILER=clang++
  -DCMAKE_C_COMPILER=clang
  -DCMAKE_INSTALL_PREFIX=${prefix}
  )
