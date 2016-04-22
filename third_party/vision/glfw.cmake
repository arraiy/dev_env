ExternalProject_Add(glfw
  PREFIX ${build_prefix}
  URL https://github.com/opencv-ai/glfw/archive/e2d5071.zip
  CMAKE_ARGS
  -DCMAKE_PREFIX_PATH=${prefix}
  -DCMAKE_INSTALL_PREFIX=${prefix}
  -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
)
