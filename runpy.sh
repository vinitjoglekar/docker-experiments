#!/bin/bash

# Refer below link to know how to use GUIs with Docker
# http://wiki.ros.org/docker/Tutorials/GUI

arg1=$1

if [ "$arg1" = "--with-internet" ]; then
  netstack="--net=bridge"
  image=$2
  command=$3
else
  netstack="--network none"
  image=$1
  command=$2
fi

if [ "$image" = "base" ]; then
  image="python-base"
elif [ "$image" = "audio" ]; then
  image="python-audio"
elif [ "$image" = "ml" ]; then
  image="python-ml"
fi

sudo docker run -it \
  --env="DISPLAY" \
  --env="QT_X11_NO_MITSHM=1" \
  --rm \
  $netstack \
  --mount type=bind,src=$HOME/github,dst=/home/u1/github \
  --mount type=bind,src=$HOME/docker_data/python,dst=/home/u1/python \
  --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
  $image $command

# $1 --> image name
#          audio (implies python-audio)
#          base (implies python-base)
#          ml (tensorflow, keras, pytorch, jax, scikit-learn)
#
# $2 --> command to run - python, bash etc.
# For example,
# ./runpy.sh [--with-internet] base bash
# ./runpy.sh [--with-internet] base python3

