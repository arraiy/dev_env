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
