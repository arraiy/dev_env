#include <gtest/gtest.h>
#include "messages.pb.h"

TEST(Messages, Point3d) {
  sample::proto::Point3d point;
  point.set_x(1.0);
  point.set_y(2.0);
  point.set_z(2.0);
  EXPECT_EQ("x: 1\ny: 2\nz: 2\n",point.DebugString());
}
