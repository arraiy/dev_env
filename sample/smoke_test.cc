#include <gtest/gtest.h>
#include <glog/logging.h>
#include <Eigen/Core>

#include "messages.pb.h"

TEST(Smoke, Proto) {
  sample::proto::Point3d point;
  point.set_x(1.0);
  point.set_y(2.0);
  point.set_z(2.0);
  EXPECT_EQ("x: 1\ny: 2\nz: 2\n",point.DebugString());
}

TEST(Smoke, Eigen) {
  Eigen::Vector3d vec(1.0, 2.0, 3.0);
  std::cout << vec << std::endl;
}

TEST(Smoke, glog) {
  google::InitGoogleLogging("smoke_test");
  LOG(INFO) << "Hello";
  int x = 1.0;
  EXPECT_DEATH(CHECK_EQ(2.0, x), "");
}
