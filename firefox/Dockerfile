FROM alpine:latest

# Alpine package details can be checked here: https://pkgs.alpinelinux.org/packages

# Install fonts so that GUI applications don't display tofu characters
# font-dejavu font-freefont font-noto-devanagari font-noto font-noto-extra

# Install Firefox browser
# firefox
RUN apk update && apk add --no-cache font-dejavu font-freefont font-noto-devanagari font-noto font-noto-extra firefox

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

