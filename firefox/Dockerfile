FROM alpine-gui:latest

# Install Firefox browser
# Alpine package details can be checked here: https://pkgs.alpinelinux.org/packages
RUN apk update && apk add --no-cache firefox 

# Add user u1
ARG USERNAME=u1
RUN adduser -D -h /home/$USERNAME $USERNAME

# Use the user for running the user process within the container
USER $USERNAME
WORKDIR /home/$USERNAME

# Copy hosts file for ad-blocker (from https://github.com/StevenBlack/hosts)
# COPY --chown=root:root hosts /etc

# To build this image, run:
# sudo docker build --tag firefox:latest firefox

