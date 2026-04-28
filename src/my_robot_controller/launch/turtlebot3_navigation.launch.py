import os
from launch import LaunchDescription
from launch_ros.actions import Node
from launch.actions import IncludeLaunchDescription
from launch.launch_description_sources import PythonLaunchDescriptionSource
from launch.substitutions import LaunchConfiguration
from ament_index_python.packages import get_package_share_directory


def generate_launch_description():

    pkg_my_robot = get_package_share_directory('my_robot_controller')
    pkg_nav2 = get_package_share_directory('turtlebot3_navigation2')
    use_sim_time = LaunchConfiguration('use_sim_time', default='true')
    map_dir = '/home/student/ws/src/MAIN_MAP/MAIN_MAP.yaml'
    params_file = os.path.join(pkg_nav2, 'param', 'humble', 'burger.yaml')

    gazebo = IncludeLaunchDescription(
        PythonLaunchDescriptionSource(
            os.path.join(pkg_my_robot, 'launch', 'turtlebot3_world.launch.py')
        )
    )

    nav2 = IncludeLaunchDescription(
        PythonLaunchDescriptionSource(
            os.path.join(pkg_nav2, 'launch', 'navigation2.launch.py')
        ),
        launch_arguments={
            'use_sim_time': use_sim_time,
            'map': map_dir,
            'params_file': params_file
        }.items()
    )

    navigation_node = Node(
        package='my_robot_controller',
        executable='navigation',
        name='navigation'
    )

    ld = LaunchDescription()
    ld.add_action(gazebo)
    ld.add_action(nav2)
    ld.add_action(navigation_node)

    return ld
