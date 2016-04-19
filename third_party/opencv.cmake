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
  DEPENDS opencv_contrib glog googletest gflags
  URL https://github.com/opencv-ai/opencv/archive/46d218b.zip
  CMAKE_ARGS
  -DOPENCV_EXTRA_MODULES_PATH=${build_prefix}/src/opencv_contrib/modules
  -DWITH_VTK=ON
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
  -DBUILD_opencv_rgbd=ON
  -DBUILD_opencv_saliency=OFF
  -DBUILD_opencv_shape=OFF
  -DBUILD_opencv_stereo=OFF
  -DBUILD_opencv_stitching=OFF
  -DBUILD_opencv_structured_light=ON
  -DBUILD_opencv_superres=OFF
  -DBUILD_opencv_surface_matching=OFF
  -DBUILD_opencv_text=OFF
  -DBUILD_opencv_tracking=OFF
  -DBUILD_opencv_ts=OFF
  -DBUILD_opencv_video=OFF
  -DBUILD_opencv_viz=ON
  -DBUILD_opencv_videoio=ON
  -DBUILD_opencv_videostab=OFF
  -DBUILD_opencv_world=OFF
  -DBUILD_opencv_xfeatures2d=OFF
  -DBUILD_opencv_ximgproc=OFF
  -DBUILD_opencv_xobjdetect=OFF
  -DBUILD_opencv_xphoto=OFF
)
