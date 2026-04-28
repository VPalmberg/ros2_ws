#!/bin/bash

SESSION="nav"
MAP="/home/student/ws/src/MAIN_MAP/MAIN_MAP.yaml"
SETUP="source /opt/ros/humble/setup.bash && source ~/ws/install/setup.bash"

tmux kill-session -t $SESSION 2>/dev/null

tmux new-session -d -s $SESSION -x 220 -y 50

# Pane 0: Gazebo
tmux send-keys -t $SESSION "$SETUP && ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py" Enter

# Pane 1: Nav2
tmux split-window -t $SESSION -v
tmux send-keys -t $SESSION "sleep 15 && $SETUP && ros2 launch turtlebot3_navigation2 navigation2.launch.py use_sim_time:=True map:=$MAP" Enter

# Pane 2: navigation node
tmux split-window -t $SESSION -v
tmux send-keys -t $SESSION "sleep 35 && $SETUP && ros2 run my_robot_controller navigation" Enter

tmux attach -t $SESSION
