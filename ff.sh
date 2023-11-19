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

# Use host network for email and fin instances, and bridge network for temporary instance
# Macvlan network automatically generates a temporary MAC address every time.
# to create a macvlan network, refer: https://docs.docker.com/network/network-tutorial-macvlan/
# TODO: This caused network issues in the browser process. Hence disabled it for now. 
# Investigate and find a better solution later.
# Example: 
#if [ "$1" = "email" ]; then
#  NET_NAME="host"
#elif [ "$1" = "fin" ]; then
#  NET_NAME="host"
#else
#  NET_NAME="my-macvlan-net"
#fi

# TODO: assign random IP in 10.0.0.0/8 range to the container
# FIELD_2=$((RANDOM%250+1))

# Create a copy of the template .mozilla directory for the container's use.
# The template .mozilla directory must be created manually with all the configurations that
# you want to use, and must be at location $HOME/docker_data/firefox/template. One way of 
# creating the template directory is to launch firefox with an empty template directory,
# configure the settings, then save that directory as the template.
# TODO: Dynamically generate the .mozilla directory with required configurations.
cp -R $HOME/docker_data/firefox/template $HOME/docker_data/firefox/$CONTEXT_NAME

# TODO: Firefox temporary files accumulate in $HOME/docker_data/firefox directory. These
# need to be manually deleted periodically. Find a way to clean it up when browser exits.

sudo -b docker run --net=bridge \
  --log-driver none \
  --env="DISPLAY="$DISPLAY \
  --env="QT_X11_NO_MITSHM=1" \
  --rm \
  --mount type=bind,src=$HOME/docker_data/firefox/$CONTEXT_NAME,dst=/home/u1/.mozilla \
  --mount type=bind,src=$HOME/docker_data/Downloads,dst=/home/u1/shared/Downloads \
  --volume="/tmp/.X11-unix:/tmp/.X11-unix:ro" \
  firefox:latest firefox

