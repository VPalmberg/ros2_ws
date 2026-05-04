import os
from launch import LaunchDescription
from launch_ros.actions import Node
from launch.actions import IncludeLaunchDescription
from launch.launch_description_sources import PythonLaunchDescriptionSource
from ament_index_python.packages import get_package_share_directory


def generate_launch_description():

    pkg_my_robot = get_package_share_directory('my_robot_controller')
    pkg_cartographer = get_package_share_directory('turtlebot3_cartographer')

    gazebo = IncludeLaunchDescription(
        PythonLaunchDescriptionSource(
            os.path.join(pkg_my_robot, 'launch', 'turtlebot3_world.launch.py')
        )
    )

    cartographer = IncludeLaunchDescription(
        PythonLaunchDescriptionSource(
            os.path.join(pkg_cartographer, 'launch', 'cartographer.launch.py')
        ),
        launch_arguments={'use_sim_time': 'true'}.items()
    )

    mapping_node = Node(
        package='my_robot_controller',
        executable='mapping',
        name='mapping_node'
    )

    ld = LaunchDescription()
    ld.add_action(gazebo)
    ld.add_action(cartographer)
    ld.add_action(mapping_node)

    return ld
