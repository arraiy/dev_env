script_link="$( readlink "$BASH_SOURCE" )" || script_link="$BASH_SOURCE"
apparent_sdk_dir="${script_link%/*}"
if [ "$apparent_sdk_dir" == "$script_link" ]; then
  apparent_sdk_dir=.
fi
sdk_dir="$( command cd -P "$apparent_sdk_dir" > /dev/null && pwd -P )"
export PATH=$sdk_dir/bin:$PATH
export OPENCV_AI_CODE_ROOT="$( command cd -P "$sdk_dir/.." > /dev/null && pwd -P)"
alias cv_cmake_init='opencvai_run cmake -DCMAKE_PREFIX_PATH=/opt/opencv_ai -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_C_COMPILER=clang -DCMAKE_BUILD_TYPE=RelWithDebInfo '
alias cv_cmake='opencvai_run cmake '
alias cv_make='opencvai_run make '
alias cv_run='opencvai_run '
