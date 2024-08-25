FROM python:3

# This is debian OS

RUN apt update && apt install -y ffmpeg

RUN pip install --no-cache-dir numpy scipy pandas
# matplotlib needs to be installed after numpy has been fully installed
RUN pip install --no-cache-dir matplotlib

# Add user u1
ARG USERNAME=u1
RUN useradd -b /home/ -m $USERNAME

# Use the user for running the user process within the container
USER $USERNAME

# CD to ~/python on running the container
WORKDIR /home/$USERNAME/python

ENV PATH=$PATH:/home/$USERNAME/.local/bin

# To build this image, run:
# sudo docker build --no-cache --tag python-base:latest python-base


