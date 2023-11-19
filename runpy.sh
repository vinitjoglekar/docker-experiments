#!/bin/bash

# Refer below link to know how to use GUIs with Docker
# http://wiki.ros.org/docker/Tutorials/GUI

image=$1
if [ "$image" = "base" ]; then
  image="python-base"
elif [ "$image" = "audio" ]; then
  image="python-audio"
fi

sudo docker run -it \
  --env="DISPLAY" \
  --env="QT_X11_NO_MITSHM=1" \
  --rm \
  --network none \
  --mount type=bind,src=$HOME/github,dst=/home/u1/github \
  --mount type=bind,src=$HOME/docker_data/python,dst=/home/u1/python \
  --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
  $image $2

# $1 --> image name
#          audio (implies python-audio)
#          base (implies python-base)
#          pytorch 
#          scikit
#
# $2 --> command to run - python, bash etc.
# For example,
# ./runpy.sh base bash
# ./runpy.sh base python3

