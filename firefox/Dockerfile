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

# Copy configuration files for Firefox to have custom settings
# TODO: This did not work out. Need to find an alternative. Refer TODO.txt.
# Until then, the by-pass id to use template as documented in `ff.sh`.
# COPY --chown=root:root autoconfig.js /usr/lib/firefox/defaults/pref
# COPY --chown=root:root firefox.cfg /usr/lib/firefox

# To build this image, run:
# sudo docker build --no-cache --tag firefox:latest firefox

