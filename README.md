ROS 2 Mapping Project

    1. Important
All further actions done in the Docker terminal.
Before running any commands, open the Docker terminal from the workspace.

Example:
cd ~/ros2_ws
./docker_terminal.sh

    2. The following packages are required for this project:
ROS 2 Humble
Gazebo
TurtleBot3 packages
Cartographer
Navigation2 map saver
Installation
sudo apt install ros-humble-gazebo-*
sudo apt install ros-humble-cartographer
sudo apt install ros-humble-cartographer-ros
sudo apt install ros-humble-navigation2
sudo apt install ros-humble-nav2-bringup
sudo apt install ros-humble-turtlebot3-msgs
sudo apt install ros-humble-turtlebot3
Workspace Preparation


    3. Build the workspace:
cd ~/ws
colcon build --symlink-install
source install/setup.bash

    4. Map Creation
The custom map is created in Gazebo using the Building Editor.
Open Gazebo:
gazebo

In Gazebo:
go to Edit
select Building Editor
draw walls and internal partitions
save the map as a .world file
The saved map file must be placed into:
src/my_robot_controller/worlds/
Launch File Configuration

To run the custom map, the following file is used:
src/my_robot_controller/launch/turtlebot3_world.launch.py
This file must contain the correct path to the custom .world file.
Rebuild After Map Changes
After changing the map or launch files, rebuild the workspace:


All further actions must be performed only in the Docker terminal.

1. Launch the custom world
ros2 launch my_robot_controller turtlebot3_world.launch.py
2. Launch Cartographer

Open a new Docker terminal and run:

ros2 launch turtlebot3_cartographer cartographer.launch.py use_sim_time:=True
3. Launch the mapping node

Open another Docker terminal and run:

ros2 run my_robot_controller mapping
Saving the Map

All further actions must be performed only in the Docker terminal.

After the environment has been fully scanned, save the map with:

ros2 run nav2_map_server map_saver_cli -f ~/ws/src/MAIN_MAP

This will generate:

MAIN_MAP.pgm
MAIN_MAP.yaml
Project Structure

Main project files:

src/my_robot_controller/my_robot_controller/mapping.py — autonomous mapping node
src/my_robot_controller/launch/turtlebot3_world.launch.py — launch file for the custom world
src/my_robot_controller/worlds/ — custom world files
src/MAIN_MAP.pgm — saved map image
src/MAIN_MAP.yaml — saved map metadata
