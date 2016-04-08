ExternalProject_Add(ceres
  PREFIX ${build_prefix}
  URL https://github.com/opencv-ai/ceres-solver/archive/5512f58536e.zip
  CMAKE_ARGS
  -DCMAKE_PREFIX_PATH=${prefix}
  -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
  -DCMAKE_CXX_COMPILER=clang++
  -DCMAKE_C_COMPILER=clang
  -DBUILD_SHARED_LIBS=OFF
  -DEIGENSPARSE=ON
  -DGFLAGS=OFF
  -DBUILD_EXAMPLES=OFF
  -DBUILD_TESTING=OFF
  -DCMAKE_INSTALL_PREFIX=${prefix}
)
