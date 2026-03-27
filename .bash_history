ros2 run demo_nodes_cpp talker
rviz
rviz2
exit
ros2 run demo_nodes_cpp listener
rqt_graph 
exit
. build_ws.sh
ros2 run my_robot_controller draw_circle
. build_ws.sh
ros2 run my_robot_controller draw_circle
ros2 run turtlesim turtlesim_node
. build_workers
. build_ws.sh
ros2 run turtlesim turtlesim_node
exit
source install/setup.bash 
ros2 run my_robot_controller draw_circle
ros2 run my_robot_controler draw_circle
ros2 run my_robot_controller draw_circle
exit
. build_ws.sh 
source install/setup.bash 
ros2 run my_robot_controller draw_circle
ros2 pkg create my_robot_controller --build-type ament_python --dependencies rclpy
exit
. build_ws.sh
run my_robot_controller drw_circle
ros2 run my_robot_controller
. build_ws.sh
ros2 launch my_robot_controller draw_circle.launch.py 
. build_ws.sh
ros2 launch my_robot_controller turtle_controller.py
exit
~./ws$ . build_ws.sh

. build_ws.sh
$ ros2 launch turtlebot3_bringup rviz2.launch.py 
. build_ws.sh
$ ros2 launch my_robot_controller turtle3_world.world 
~./ws$ . build_ws.sh
. build_ws.sh
ros2 launch my_robot_controller turtle_controller.py
. build_ws.sh
ros2 launch my_robot_controller turtle_controller.py
. build_ws.sh
ros2 launch my_robot_controller turtle3_world.world 
. build_ws.sh
ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py
exit
. build_ws.sh
ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py
ros2 launch turtlebot3_cartographer cartographer.launch.py use_sim_time:=True
ros2 run my_robot_controller mapping
. build_ws.sh
ros2 pkg list
ros2 launch my_robot_controller turtlebot3_world.launch.py
colcon build --symlink-install
source install/setup.bash
ros2 launch my_robot_controller turtlebot3_world.launch.py
pkill -f ros2
. build_ws.sh 
ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py
pkill -f gzserver
pkill -f gzclient
. build_ws.sh 
ros2 launch turtlebot3_gazebo turtlebot3_world.launch.
gazebo
. build_ws.sh 
gazebo
ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py
pkill -9 -f gzserver
pkill -9 -f gzclient
pkill -9 -f gazebo
pkill -9 -f cartographer
pkill -9 -f rviz2
pkill -9 -f robot_state_publisher
pkill -9 -f spawn_entity
pkill -9 -f turtlebot3
pkill -9 -f ros2
pkill -9 -f python3
ps aux | grep -E "gzserver|gzclient|gazebo|cartographer|rviz2|ros2|turtlebot3"
exit
gazebo
gazebo ~/src/my_robot_controller/worlds/Lab.world
gazebo ~/ws/src/my_robot_controller/worlds/Lab.world
ls -l /home/student/ws/src/my_robot_controller/worlds/Lab.world
gazebo --verbose /home/student/ws/src/my_robot_controller/worlds/Lab.world
pkill -9 -f gzserver
pkill -9 -f gzclient
pkill -9 -f gazebo
gazebo --verbose /home/student/ws/src/my_robot_controller/worlds/Lab.world
gzserver /home/student/ws/src/my_robot_controller/worlds/Lab.world
gazebo
exit
colcon build --symlink-install
source ~/.bashrc
ros2 launch my_robot_controller turtlebot3_world.launch.py
colcon build --symlink-install
source install/setup.bash
ros2 launch my_robot_controller turtlebot3_world.launch.py
pkill -f ros2
pkill -f gzserver
pkill -f gzclient
killall -9 gzserver gzclient
pkill -f ros2
ps aux | grep gz
ps aux | grep ros2
exit
