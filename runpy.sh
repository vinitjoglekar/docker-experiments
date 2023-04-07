#!/bin/bash

# Refer below link to know how to use GUIs with Docker
# http://wiki.ros.org/docker/Tutorials/GUI

sudo docker run -it \
  --env="DISPLAY" \
  --env="QT_X11_NO_MITSHM=1" \
  --rm \
  --mount type=bind,src=$HOME/github,dst=/github \
  --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
  $1 $2

# $1 --> image name - pytorch, scikit-image etc.
# $2 --> command to run - python, bash etc.
# For example,
# ./runpy.sh scikit-image bash

