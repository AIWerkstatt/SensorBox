#!/bin/bash

# NVIDIA Jetson Xavier NX with Linux4Tegra (L4T) Docker Image
# -----------------------------------------------------------

# List of consecutively build Docker Images:
# nvcr.io/nvidia/l4t-base:r32.5.0
# aiwerkstatt/sensorbox/setup/ubuntu:v1.0-l4t5.0
# aiwerkstatt/sensorbox/setup/arducamsonyimx219:v1.0-l4t5.0
# aiwerkstatt/sensorbox/setup/intelrealsensed435i:v1.0-l4t5.0
# aiwerkstatt/sensorbox/setup/flirlepton3.5:v1.0-l4t5.0
# aiwerkstatt/sensorbox/setup/sparkfunredboardturbo:v1.0-l4t5.0
# aiwerkstatt/sensorbox/setup/sensorsuite:v1.0-l4t5.0

xhost +si:localuser:root
sudo docker run -it --rm --net=host --privileged --cap-add=ALL \
   --runtime=nvidia \
   -e DISPLAY=$DISPLAY \
   -e QT_GRAPHICSSYSTEM=native \
   -e QT_X11_NO_MITSHM=1 \
   -v /dev:/dev \
   -v /etc/udev:/etc/udev \
   -v /lib/modules:/lib/modules \
   -v /tmp/.X11-unix:/tmp/.X11-unix \
   -v /tmp/argus_socket:/tmp/argus_socket \
   -u $(id -u ${USER}):$(id -g ${USER}) \
   -e USER=$USER \
   --group-add sudo \
   --group-add video \
   --group-add tty \
   --group-add dialout \
   --group-add uucp \
   --group-add plugdev \
   -v "/etc/group:/etc/group:ro" \
   -v "/etc/passwd:/etc/passwd:ro" \
   -v "/etc/shadow:/etc/shadow:ro" \
   -v "/etc/sudoers.d:/etc/sudoers.d:ro" \
   -v /home/${USER}/:/home/${USER} \
   -w /home/${USER} \
   -v /media/${USER}/:/media/${USER} \
   -v /usr/bin/tegrastats:/usr/bin/tegrastats \
   aiwerkstatt/sensorbox/setup/sensorsuite:v1.0-l4t5.0 \
   "bash"
xhost -si:localuser:root

