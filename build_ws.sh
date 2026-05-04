#!/usr/bin/env bash
set -e

source /opt/ros/humble/setup.bash

echo "Building Workspace with Colcon..."

if touch install/.write_test 2>/dev/null; then
    rm install/.write_test
    BUILD_BASE=build
    INSTALL_BASE=install
    LOG_BASE=/tmp/colcon_log
else
    echo "Warning: install/ not writable, using /tmp"
    mkdir -p /tmp/colcon_build /tmp/colcon_install /tmp/colcon_log
    BUILD_BASE=/tmp/colcon_build
    INSTALL_BASE=/tmp/colcon_install
    LOG_BASE=/tmp/colcon_log
fi

colcon --log-base $LOG_BASE build \
    --build-base $BUILD_BASE \
    --install-base $INSTALL_BASE \
    --symlink-install \
    --cmake-args -DCMAKE_BUILD_TYPE=Release

source $INSTALL_BASE/setup.bash
echo "Done. In each new terminal run:"
echo "  source /opt/ros/humble/setup.bash && source $INSTALL_BASE/setup.bash"
