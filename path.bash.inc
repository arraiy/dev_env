script_link="$( readlink "$BASH_SOURCE" )" || script_link="$BASH_SOURCE"
apparent_sdk_dir="${script_link%/*}"
if [ "$apparent_sdk_dir" == "$script_link" ]; then
  apparent_sdk_dir=.
fi
sdk_dir="$( command cd -P "$apparent_sdk_dir" > /dev/null && pwd -P )"

cv_run() {
  $sdk_dir/cv_run $@
}

cv_cmake_init() {
  cv_run cmake \
  -DCMAKE_PREFIX_PATH=/opt/opencv_ai \
  -DCMAKE_CXX_COMPILER=clang++ \
  -DCMAKE_C_COMPILER=clang \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  $@
}

cv_cmake() {
  cv_run cmake $@
}

cv_make() {
  cv_run make $@
}

cv_test() {
  cv_run ctest $@
}
