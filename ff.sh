#!/bin/bash

# Command line arguments
# $1 - (Optional) Firefox context name. It can be an arbitrary alphanumeric string. If no 
#      argument is provided, then creates a new random context name, which is actually a UUID.
#      This script depends on "dbus-uuidgen" utility to generate a UUID on the fly.
#      A context name effectively creates an instance of firefox isolated from other instances.
#      Each instance has an isolated cookie store, history, preferences etc.

# Notes:
#   1. Refer this to know how to use GUIs with Docker: http://wiki.ros.org/docker/Tutorials/GUI
#   2. "-b" argument to sudo runs the command in the background freeing up the console terminal
#   3. The DISPLAY and QT_X11_NO_MITSHM environment variables, along with the volume mount of
#      /tmp/.X11-unix, ensures that the container OS connects to the hosts's Unix domain socket
#      Refer: https://stackoverflow.com/a/25334301 and https://unix.stackexchange.com/a/196680
#   4. firefox:latest image has been configured to run user process using user "u1"
#

if [ $# -eq 0 ]
  then
    uuid=$(dbus-uuidgen)
    CONTEXT_NAME=$uuid
else 
    CONTEXT_NAME=$1
fi

# Create a copy of the template .mozilla configuration directory for the container's use
cp -R $HOME/docker_data/firefox/template $HOME/docker_data/firefox/$CONTEXT_NAME

sudo -b docker run --net=host \
  --log-driver none \
  --env="DISPLAY="$DISPLAY \
  --env="QT_X11_NO_MITSHM=1" \
  --rm \
  --mount type=bind,src=$HOME/docker_data/firefox/$CONTEXT_NAME,dst=/home/u1/.mozilla \
  --mount type=bind,src=$HOME/docker_data/Downloads,dst=/home/u1/shared/Downloads \
  --volume="/tmp/.X11-unix:/tmp/.X11-unix:ro" \
  firefox:latest firefox

