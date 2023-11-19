FROM python:3

# This is debian OS

# Add user u1
ARG USERNAME=u1
RUN useradd -b /home/ -m $USERNAME

# Use the user for running the user process within the container
USER $USERNAME

# CD to /github on running the container
WORKDIR /github

ENV PATH=$PATH:/home/$USERNAME/.local/bin

COPY requirements-pytorch.txt ./requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
# matplotlib needs to be installed after numpy has been fully installed
RUN pip install --no-cache-dir matplotlib

# To build this image, run:
# sudo docker build --no-cache --tag pytorch:latest pytorch
