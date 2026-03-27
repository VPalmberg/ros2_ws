#!/usr/bin/env python3

import math

import rclpy
from rclpy.node import Node
from geometry_msgs.msg import Twist
from sensor_msgs.msg import LaserScan


class TurtlebotMappingNode(Node):
    def __init__(self):
        super().__init__("mapping_node")
        self.get_logger().info("Mapping Node has started.")

        self._pose_publisher = self.create_publisher(
            Twist, "/cmd_vel", 10
        )

        self._scan_listener = self.create_subscription(
            LaserScan, "/scan", self.robot_controller, 10
        )

    def safe_min(self, values):
        valid = [v for v in values if not math.isinf(v) and not math.isnan(v)]
        if not valid:
            return 10.0
        return min(valid)

    def safe_avg(self, values):
        valid = [v for v in values if not math.isinf(v) and not math.isnan(v)]
        if not valid:
            return 10.0
        return sum(valid) / len(valid)

    def robot_controller(self, scan: LaserScan):
        cmd = Twist()
        ranges = list(scan.ranges)

        front = self.safe_min(list(ranges[0:18]) + list(ranges[-18:]))
        front_left = self.safe_min(ranges[20:55])
        left = self.safe_avg(ranges[70:110])
        front_right = self.safe_min(ranges[305:340])
        right = self.safe_avg(ranges[250:290])

        dead_end = front < 0.75 and front_left < 0.80 and front_right < 0.80
        obstacle_ahead = front < 0.95

        left_passage = left > 1.00 and front_left > 0.90
        right_passage = right > 0.90 and front_right > 0.80

        left_too_close = left < 0.30
        right_too_close = right < 0.30

        narrow_passage = front > 0.75 and front < 1.30 and (
            (front_left < 0.75 and front_right > 0.85) or
            (front_right < 0.75 and front_left > 0.85) or
            (left < 0.55 and right < 0.55 and front > 0.85)
        )

        if dead_end:
            cmd.linear.x = -0.03
            if left > right:
                cmd.angular.z = 0.90
            else:
                cmd.angular.z = -0.90

        elif narrow_passage:
            cmd.linear.x = 0.12

            corridor_error = left - right
            cmd.angular.z = max(min(0.18 * corridor_error, 0.22), -0.22)

            if front_left > front_right + 0.15:
                cmd.angular.z += 0.08
            elif front_right > front_left + 0.15:
                cmd.angular.z -= 0.08

        elif obstacle_ahead:
            cmd.linear.x = 0.06
            if left_passage and not right_passage:
                cmd.angular.z = 0.70
            elif right_passage and not left_passage:
                cmd.angular.z = -0.70
            else:
                if left > right:
                    cmd.angular.z = 0.60
                else:
                    cmd.angular.z = -0.60

        elif left_passage and not right_passage:
            cmd.linear.x = 0.18
            cmd.angular.z = 0.22

        elif right_passage and not left_passage:
            cmd.linear.x = 0.18
            cmd.angular.z = -0.22

        elif left_too_close:
            cmd.linear.x = 0.22
            cmd.angular.z = -0.16

        elif right_too_close:
            cmd.linear.x = 0.22
            cmd.angular.z = 0.16

        else:
            cmd.linear.x = 0.30
            corridor_error = left - right
            cmd.angular.z = max(min(0.08 * corridor_error, 0.12), -0.12)

        self._pose_publisher.publish(cmd)


def main(args=None):
    rclpy.init(args=args)
    node = TurtlebotMappingNode()
    rclpy.spin(node)
    rclpy.shutdown()


if __name__ == "__main__":
    main()