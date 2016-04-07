cmake_minimum_required(VERSION 2.8)
project(opencv_ai_third_party)

include(ExternalProject)

set(prefix /opt/opencv_ai)
set(build_prefix ${CMAKE_CURRENT_BINARY_DIR}/external)

ExternalProject_Add(gflags
  PREFIX ${build_prefix}
  URL https://github.com/opencv-ai/gflags/archive/9353bca5e99dc4.zip
  CMAKE_ARGS
  -DCMAKE_PREFIX_PATH=${prefix}
  -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
  -DCMAKE_CXX_COMPILER=clang++
  -DCMAKE_C_COMPILER=clang
  -DCMAKE_INSTALL_PREFIX=${prefix})

ExternalProject_Add(glog
  PREFIX ${build_prefix}
  DEPENDS gflags
  URL https://github.com/opencv-ai/glog/archive/f176cc84543e.zip
  CMAKE_ARGS
  -DCMAKE_PREFIX_PATH=${prefix}
  -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
  -DCMAKE_CXX_COMPILER=clang++
  -DCMAKE_C_COMPILER=clang
  -DCMAKE_INSTALL_PREFIX=${prefix})

ExternalProject_Add(googletest
  DEPENDS gflags glog
  PREFIX ${build_prefix}
  URL https://github.com/opencv-ai/googletest/archive/d225acc90bc3a8.zip
  CMAKE_ARGS
  -DCMAKE_PREFIX_PATH=${prefix}
  -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
  -DCMAKE_CXX_COMPILER=clang++
  -DCMAKE_C_COMPILER=clang
  -DCMAKE_INSTALL_PREFIX=${prefix}
  )

ExternalProject_Add(protobuf
  PREFIX ${build_prefix}
  DEPENDS googletest
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

ExternalProject_Add(opencv_contrib
  PREFIX ${build_prefix}
  URL https://github.com/opencv-ai/opencv_contrib/archive/5eb8bf940.zip
  UPDATE_COMMAND ""
  CONFIGURE_COMMAND ""
  BUILD_COMMAND ""
  INSTALL_COMMAND ""
  )

ExternalProject_Add(opencv
  PREFIX ${build_prefix}
  DEPENDS googletest protobuf opencv_contrib
  URL https://github.com/opencv-ai/opencv/archive/46d218b.zip
  CMAKE_ARGS
  -DOPENCV_EXTRA_MODULES_PATH=${build_prefix}/src/opencv_contrib/modules
  -DWITH_VTK=OFF
  -DCMAKE_PREFIX_PATH=${prefix}
  -DCMAKE_INSTALL_PREFIX=${prefix}
  -DCMAKE_CXX_COMPILER=clang++
  -DCMAKE_C_COMPILER=clang
  -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
  -DBUILD_opencv_apps=OFF
  -DBUILD_opencv_aruco=ON
  -DBUILD_opencv_bgsegm=OFF
  -DBUILD_opencv_bioinspired=OFF
  -DBUILD_opencv_calib3d=ON
  -DBUILD_opencv_ccalib=OFF
  -DBUILD_opencv_contrib_world=OFF
  -DBUILD_opencv_core=ON
  -DBUILD_opencv_datasets=OFF
  -DBUILD_opencv_dnn=OFF
  -DBUILD_opencv_dpm=OFF
  -DBUILD_opencv_face=OFF
  -DBUILD_opencv_features2d=ON
  -DBUILD_opencv_flann=ON
  -DBUILD_opencv_fuzzy=OFF
  -DBUILD_opencv_highgui=ON
  -DBUILD_opencv_imgcodecs=ON
  -DBUILD_opencv_imgproc=ON
  -DBUILD_opencv_line_descriptor=OFF
  -DBUILD_opencv_ml=ON
  -DBUILD_opencv_objdetect=OFF
  -DBUILD_opencv_optflow=OFF
  -DBUILD_opencv_photo=OFF
  -DBUILD_opencv_plot=OFF
  -DBUILD_opencv_python2=OFF
  -DBUILD_opencv_reg=OFF
  -DBUILD_opencv_rgbd=OFF
  -DBUILD_opencv_saliency=OFF
  -DBUILD_opencv_shape=OFF
  -DBUILD_opencv_stereo=OFF
  -DBUILD_opencv_stitching=OFF
  -DBUILD_opencv_structured_light=OFF
  -DBUILD_opencv_superres=OFF
  -DBUILD_opencv_surface_matching=OFF
  -DBUILD_opencv_text=OFF
  -DBUILD_opencv_tracking=OFF
  -DBUILD_opencv_ts=OFF
  -DBUILD_opencv_video=OFF
  -DBUILD_opencv_videoio=ON
  -DBUILD_opencv_videostab=OFF
  -DBUILD_opencv_world=OFF
  -DBUILD_opencv_xfeatures2d=OFF
  -DBUILD_opencv_ximgproc=OFF
  -DBUILD_opencv_xobjdetect=OFF
  -DBUILD_opencv_xphoto=OFF
)

ExternalProject_Add(boost
  PREFIX ${build_prefix}
  URL "http://sourceforge.net/projects/boost/files/boost/1.60.0/boost_1_60_0.tar.bz2/download"
  URL_MD5 65a840e1a0b13a558ff19eeb2c4f0cbe
  BUILD_IN_SOURCE 1
  UPDATE_COMMAND ""
  PATCH_COMMAND ""
  CONFIGURE_COMMAND ./bootstrap.sh
  BUILD_COMMAND ./b2 install
    toolset=clang
    --build-type=minimal
    --with-program_options
    --with-filesystem
    --prefix=${prefix}
    -j7
  INSTALL_COMMAND ""
  INSTALL_DIR ${prefix}
)
