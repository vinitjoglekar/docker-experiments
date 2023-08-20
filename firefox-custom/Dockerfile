FROM firefox:latest

# Copy configuration files for Firefox
COPY --chown=root:root autoconfig.js /usr/lib/firefox/defaults/pref
COPY --chown=root:root firefox.cfg /usr/lib/firefox

# To build this image, run:
# sudo docker build --tag firefox-custom:latest firefox-custom

