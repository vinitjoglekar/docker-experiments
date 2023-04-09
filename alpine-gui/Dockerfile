FROM alpine:latest

# Install fonts so that GUI applications don't display tofu characters
# Alpine package details can be checked here: https://pkgs.alpinelinux.org/packages
RUN apk update && apk add --no-cache font-dejavu font-freefont font-noto-devanagari font-noto font-noto-extra

# To build this image, run:
# sudo docker build --tag alpine-gui:latest alpine-gui

