#!/bin/bash

# NVIDIA Jetson Xavier NX with Linux4Tegra (L4T) Image
# ====================================================
# https://ngc.nvidia.com/catalog/containers/nvidia:l4t-base

sudo docker pull nvcr.io/nvidia/l4t-base:r32.5.0

DOCKER_BUILDKIT=1 sudo docker build -f Dockerfile-1-Ubuntu \
       --build-arg BASE=nvcr.io/nvidia/l4t-base:r32.5.0 \
       --tag aiwerkstatt/sensorbox/setup/ubuntu:v1.0-l4t5.0 ../../NVIDIA_Jetson_Xavier_NX 

# Arducam Sony IMX219
# ===================

DOCKER_BUILDKIT=1 sudo docker build -f Dockerfile-2-Arducam_Sony_IMX219 \
       --build-arg BASE=aiwerkstatt/sensorbox/setup/ubuntu:v1.0-l4t5.0 \
       --tag aiwerkstatt/sensorbox/setup/arducamsonyimx219:v1.0-l4t5.0 ../../NVIDIA_Jetson_Xavier_NX 

# Intel RealSense D435i
# =====================

# Intel RealSense librealsense can be installed as
# a) Debian package
# use --build-arg REALSENSE=realsense-debian
# b) Build from source
# use --build-arg REALSENSE=realsense-source
DOCKER_BUILDKIT=1 sudo docker build -f Dockerfile-3-Intel_RealSense_D435i \
       --build-arg BASE=aiwerkstatt/sensorbox/setup/arducamsonyimx219:v1.0-l4t5.0 \
       --build-arg REALSENSE=realsense-source \
       --tag aiwerkstatt/sensorbox/setup/intelrealsensed435i:v1.0-l4t5.0 ../../NVIDIA_Jetson_Xavier_NX

# FLIR Lepton 3.5 with Group Gets PureThermal 2
# =============================================

DOCKER_BUILDKIT=1 sudo docker build -f Dockerfile-4-FLIR_Lepton_3.5 \
       --build-arg BASE=aiwerkstatt/sensorbox/setup/intelrealsensed435i:v1.0-l4t5.0 \
       --tag aiwerkstatt/sensorbox/setup/flirlepton3.5:v1.0-l4t5.0 ../../NVIDIA_Jetson_Xavier_NX 

# SparkFun RedBoard Turbo
# =======================

DOCKER_BUILDKIT=1 sudo docker build -f Dockerfile-5-SparkFun_RedBoard_Turbo \
       --build-arg BASE=aiwerkstatt/sensorbox/setup/flirlepton3.5:v1.0-l4t5.0 \
       --tag aiwerkstatt/sensorbox/setup/sparkfunredboardturbo:v1.0-l4t5.0 ../../SparkFun_RedBoard_Turbo 

# Sensor Suite
# ============
# required Sparkfun RedBoard Turbo

DOCKER_BUILDKIT=1 sudo docker build -f Dockerfile-6-Sensor_Suite \
       --build-arg BASE=aiwerkstatt/sensorbox/setup/sparkfunredboardturbo:v1.0-l4t5.0 \
       --tag aiwerkstatt/sensorbox/setup/sensorsuite:v1.0-l4t5.0 ../../SparkFun_RedBoard_Turbo

