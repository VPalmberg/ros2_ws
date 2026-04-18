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
nano Dockerfile
exit
ros2 launch ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py
ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py
source /opt/ros/humble/setup.bash
ls
pwd
ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py
Finished <<< turtlebot3_gazebo [9.55s]
Starting >>> turtlebot3_simulations
Finished <<< turtlebot3_simulations [0.43s]                 
Summary: 5 packages finished [10.2s]
vpalmberg@VPalmberg-2025:~/ros2_ws$ source ~/ros2_ws/install/setup.bash
vpalmberg@VPalmberg-2025:~/ros2_ws$ nano ~/.bashrc
vpalmberg@VPalmberg-2025:~/ros2_ws$ source ~/.bashrc
vpalmberg@VPalmberg-2025:~/ros2_ws$ nano ~/ros2_ws/src/my_robot_controller/my_robot_controller/my_first_node.py
vpalmberg@VPalmberg-2025:~/ros2_ws$ cd ~/ros2_ws
source /opt/ros/humble/setup.bash
colcon build
Starting >>> turtlebot3_fake_node
Starting >>> turtlebot3_gazebo
Starting >>> turtlebot3_manipulation_gazebo
Starting >>> my_robot_controller
Finished <<< turtlebot3_manipulation_gazebo [0.20s]                                                                 
Finished <<< turtlebot3_fake_node [0.21s]
Finished <<< turtlebot3_gazebo [0.21s]
Starting >>> turtlebot3_simulations
Finished <<< turtlebot3_simulations [0.04s]
Finished <<< my_robot_controller [0.53s]          
Summary: 5 packages finished [0.70s]
vpalmberg@VPalmberg-2025:~/ros2_ws$ source ~/.bashrc
vpalmberg@VPalmberg-2025:~/ros2_ws$ cd
vpalmberg@VPalmberg-2025:~$ source ~/.bashrc
vpalmberg@VPalmberg-2025:~$ cd ros2_ws
vpalmberg@VPalmberg-2025:~/ros2_ws$ . docker_terminal.sh 
Entering ROS 2 Humble Environment...
bash: /home/student/ws/install/setup.bash: No such file or directory
student@VPalmberg-2025:~/ws$ ros2 launch ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py
Package 'ros2' not found: "package 'ros2' not found, searching: ['/opt/ros/humble']"
student@VPalmberg-2025:~/ws$ ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py
Package 'turtlebot3_gazebo' not found: "package 'turtlebot3_gazebo' not found, searching: ['/opt/ros/humble']"
student@VPalmberg-2025:~/ws$ source /opt/ros/humble/setup.bash
ls
pwd
build  build_ws.sh  install  log  src
/home/student/ws
student@VPalmberg-2025:~/ws$ ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py
Package 'turtlebot3_gazebo' not found: "package 'turtlebot3_gazebo' not found, searching: ['/opt/ros/humble']"
student@VPalmberg-2025:~/ws$ 
student@VPalmberg-2025:~/ws$ rm -rf build install log
source /opt/ros/humble/setup.bash
colcon build
exit
cd /home/student/ws
pwd
ls
mkdir -p log
source /opt/ros/humble/setup.bash
colcon build
cd /home/student/ws
rm -rf log
mkdir log
ls -ld log
source /opt/ros/humble/setup.bash
colcon build --log-base /tmp/colcon_log
cd /home/student/ws
sudo rm -rf build install log
mkdir -p /tmp/colcon_log
source /opt/ros/humble/setup.bash
colcon --log-base /tmp/colcon_log build
cd /home/student/ws
source /opt/ros/humble/setup.bash
colcon   --build-base /tmp/ws_build   --install-base /tmp/ws_install   --log-base /tmp/ws_log   build
exit
ros2 run my_robot_controller mapping
ros2 launch  my_robot_controller mapping
[200~ROS 2 Mapping Project
All further actions done in the Docker terminal.
Before running any commands, open the Docker terminal from the workspace.
Example:
cd ~/ros2_ws
./docker_terminal.sh
ROS 2 Humble
Gazebo
TurtleBot3 packages
Cartographer
Navigation2 map saver
Installation
sudo apt install ros-humble-gazebo-*
xxxx
os2 run my_robot_controller mapping
ros2 run my_robot_controller mapping
cd ~/ros2_ws
. docker_terminal.sh
source /opt/ros/humble/setup.bash
colcon --log-base /ws/docker_log build --build-base /ws/docker_build --install-base /ws/docker_install
source /ws/docker_install/setup.bash
ros2 pkg list | grep my_robot_controller
os2 run my_robot_controller mapping
ros2 run my_robot_controller mapping
source /opt/ros/humble/setup.bash
colcon --log-base /ws/docker_log build --build-base /ws/docker_build --install-base /ws/docker_install
source /ws/docker_install/setup.bash
ros2 pkg list | grep my_robot_controller
sudo mkdir -p /ws/docker_log /ws/docker_build /ws/docker_install
sudo chown -R student:student /ws/docker_log /ws/docker_build /ws/docker_install
source /opt/ros/humble/setup.bash
colcon --log-base /ws/docker_log build --build-base /ws/docker_build --install-base /ws/docker_install
source /ws/docker_install/setup.bash
ros2 pkg list | grep my_robot_controller
ros2 run my_robot_controller mapping
exit
ros2 launch turtlebot3_cartographer cartographer.launch.py 
exit
cd /home/student/ws
source /opt/ros/humble/setup.bash
colcon build --build-base /tmp/ws_build --install-base /tmp/ws_install
mkdir -p /tmp/ws_log /tmp/ws_build /tmp/ws_install
source /opt/ros/humble/setup.bash
colcon --log-base /tmp/ws_log build --build-base /tmp/ws_build --install-base /tmp/ws_install
source /tmp/ws_install/setup.bash
ros2 pkg list | grep turtlebot3_gazebo
colcon --log-base /tmp/ws_log build --build-base /tmp/ws_build --install-base /tmp/ws_install
source /tmp/ws_install/setup.bash
ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py
ros2 launch my_robot_controller turtlebot3_world.launch.py 
clean
clear
exit
cd /root/ros2_ws
ls
[200~cd ~/ws/src
cd ~/ws/src
ls
CLEAR
clear
cd ~/ws/src/my_robot_controller
mkdir -p maps
cp ~/ws/src/map.yaml ~/ws/src/my_robot_controller/maps/
cp ~/ws/src/map.pgm ~/ws/src/my_robot_controller/maps/
ls ~/ws/src/my_robot_controller/maps
tree
clear
mv ~/ros2_ws/src/my_robot_controller/launch/navigation.py ~/ros2_ws/src/my_robot_controller/my_robot_controller/navigation.py
cd
mv ~/ros2_ws/src/my_robot_controller/launch/navigation.py ~/ros2_ws/src/my_robot_controller/my_robot_controller/navigation.py
~/ws
cd ros2_ws
clear
mv ~/ws/src/my_robot_controller/launch/navigation.py ~/ws/src/my_robot_controller/my_robot_controller/navigation.py
ls ~/ws/src/my_robot_controller/my_robot_controller
ls ~/ws/src/my_robot_controller/launch
nano ~/ws/src/my_robot_controller/setup.py
vi ~/ws/src/my_robot_controller/setup.py
clear
cat ~/ws/src/my_robot_controller/setup.py
cat ~/ws/src/my_robot_controller/package.xml
cp ~/ws/src/my_robot_controller/setup.py ~/ws/src/my_robot_controller/setup.py.bak
cp ~/ws/src/my_robot_controller/package.xml ~/ws/src/my_robot_controller/package.xml.bak
clear
grep -n "navigation = my_robot_controller.navigation:main" ~/ws/src/my_robot_controller/setup.py
grep -n "nav_msgs\|geometry_msgs\|tf_transformations" ~/ws/src/my_robot_controller/package.xml
clear
ros2 topic info /initialpose
ros2 topic info /goal_pose 
clear
cp ~/ws/src/my_robot_controller/setup.py ~/ws/src/my_robot_controller/setup.py.bak
cat > ~/ws/src/my_robot_controller/setup.py <<'EOF'
from setuptools import find_packages, setup
from glob import glob

package_name = 'my_robot_controller'

setup(
    name=package_name,
    version='0.0.0',
    packages=find_packages(exclude=['test']),
    data_files=[
        ('share/ament_index/resource_index/packages',
            ['resource/' + package_name]),
        ('share/' + package_name, ['package.xml']),
        ('share/' + package_name + '/launch', glob('launch/*.launch.py')),
        ('share/' + package_name + '/maps', glob('maps/*')),
        ('share/' + package_name + '/worlds', glob('worlds/*')),
    ],
    install_requires=['setuptools'],
    zip_safe=True,
    maintainer='student',
    maintainer_email='student@todo.todo',
    description='My robot controller package',
    license='TODO: License declaration',
    extras_require={
        'test': [
            'pytest',
        ],
    },
    entry_points={
        'console_scripts': [
            'test_node = my_robot_controller.my_first_node:main',
            'draw_circle = my_robot_controller.draw_circle:main',
            'mapping = my_robot_controller.mapping:main',
            'navigation = my_robot_controller.navigation:main',
        ],
    },
)
EOF

cat ~/ws/src/my_robot_controller/setup.py
grep -n "tf_transformations" ~/ws/src/my_robot_controller/my_robot_controller/navigation.py
clear
cp ~/ws/src/my_robot_controller/package.xml ~/ws/src/my_robot_controller/package.xml.bak
cat > ~/ws/src/my_robot_controller/package.xml <<'EOF'
<?xml version="1.0"?>
<?xml-model href="http://download.ros.org/schema/package_format3.xsd" schematypens="http://www.w3.org/2001/XMLSchema"?>
<package format="3">
  <name>my_robot_controller</name>
  <version>0.0.0</version>
  <description>My robot controller package</description>
  <maintainer email="student@todo.todo">student</maintainer>
  <license>TODO: License declaration</license>

  <depend>rclpy</depend>
  <depend>geometry_msgs</depend>
  <depend>sensor_msgs</depend>
  <depend>turtlesim</depend>
  <depend>nav_msgs</depend>
  <depend>tf_transformations</depend>

  <test_depend>ament_copyright</test_depend>
  <test_depend>ament_flake8</test_depend>
  <test_depend>ament_pep257</test_depend>
  <test_depend>python3-pytest</test_depend>

  <export>
    <build_type>ament_python</build_type>
  </export>
</package>
EOF

cd ~/ws
colcon build --symlink-install
source install/setup.bash
ros2 pkg executables my_robot_controller
clear
cat > ~/ws/src/my_robot_controller/package.xml <<'EOF'
<?xml version="1.0"?>
<?xml-model href="http://download.ros.org/schema/package_format3.xsd" schematypens="http://www.w3.org/2001/XMLSchema"?>
<package format="3">
  <name>my_robot_controller</name>
  <version>0.0.0</version>
  <description>My robot controller package</description>
  <maintainer email="student@todo.todo">student</maintainer>
  <license>TODO: License declaration</license>

  <depend>rclpy</depend>
  <depend>geometry_msgs</depend>
  <depend>sensor_msgs</depend>
  <depend>turtlesim</depend>
  <depend>nav_msgs</depend>
  <depend>tf_transformations</depend>

  <test_depend>ament_copyright</test_depend>
  <test_depend>ament_flake8</test_depend>
  <test_depend>ament_pep257</test_depend>
  <test_depend>python3-pytest</test_depend>

  <export>
    <build_type>ament_python</build_type>
  </export>
</package>
EOF

cat ~/ws/src/my_robot_controller/package.xml
cd ~/ws
rm -rf build install log
exit
clear
ros2 launch my_robot_controller turtlebot3_world.launch.py
tree
clear
cd ~/ros2_ws
./docker_terminal.sh
pwd
ls
ls src
ls src/my_robot_controller
cd ~/ws
source install/setup.bash
ros2 pkg list | grep my_robot_controller
ros2 launch my_robot_controller turtlebot3_world.launch.py
cd ~/ws
rm -rf build install log
. build_ws.sh
source install/setup.bash
ros2 pkg list | grep my_robot_controller
ros2 launch my_robot_controller turtlebot3_world.launch.py
clear
exit
