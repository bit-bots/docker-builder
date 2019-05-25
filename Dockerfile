# Use upstream melodic images as base
FROM ros:melodic-ros-base-bionic AS bitbots-builder

ARG uid=1001
ARG gid=1001

# Install system dependencies
RUN apt-get update; \
    apt-get install -y python3-pip python-pip python-rospkg python-catkin-pkg python-catkin-lint python-rosdep


# Setup catkin workspace
RUN . /opt/ros/melodic/setup.sh; \
    mkdir -p /catkin_ws/src; cd /catkin_ws; \
    catkin init; \
    catkin build; \
    chmod -R 777 /catkin_ws;

# Setup entrypoint
COPY entrypoint.bash /entrypoint.bash
ENTRYPOINT ["/entrypoint.bash"]