#!/bin/bash

# Host Ubuntu 18.04 LTS with NVIDIA CUDA and OpenGL Image
# =======================================================
# https://ngc.nvidia.com/catalog/containers/nvidia:cudagl

sudo docker pull nvcr.io/nvidia/cudagl:11.0-devel-ubuntu18.04

DOCKER_BUILDKIT=1 sudo docker build -f ../../NVIDIA_Jetson_Xavier_NX/Docker/Dockerfile-1-Ubuntu \
       --build-arg BASE=nvcr.io/nvidia/cudagl:11.0-devel-ubuntu18.04 \
       --tag aiwerkstatt/sensorbox/setup/ubuntu:v1.0-ubuntu18 ../../NVIDIA_Jetson_Xavier_NX 

# Intel RealSense D435i
# =====================

# Intel RealSense librealsense can be installed as
# a) Debian package
# use --build-arg REALSENSE=realsense-debian
# b) Build from source
# use --build-arg REALSENSE=realsense-source
DOCKER_BUILDKIT=1 sudo docker build -f ../../NVIDIA_Jetson_Xavier_NX/Docker/Dockerfile-3-Intel_RealSense_D435i \
       --build-arg BASE=aiwerkstatt/sensorbox/setup/ubuntu:v1.0-ubuntu18 \
       --build-arg REALSENSE=realsense-source \
       --tag aiwerkstatt/sensorbox/setup/intelrealsensed435i:v1.0-ubuntu18 ../../NVIDIA_Jetson_Xavier_NX

# FLIR Lepton 3.5 with Group Gets PureThermal 2
# =============================================

DOCKER_BUILDKIT=1 sudo docker build -f ../../NVIDIA_Jetson_Xavier_NX/Docker/Dockerfile-4-FLIR_Lepton_3.5 \
       --build-arg BASE=aiwerkstatt/sensorbox/setup/intelrealsensed435i:v1.0-ubuntu18 \
       --tag aiwerkstatt/sensorbox/setup/flirlepton3.5:v1.0-ubuntu18 ../../NVIDIA_Jetson_Xavier_NX 

# SparkFun RedBoard Turbo
# =======================

DOCKER_BUILDKIT=1 sudo docker build -f ../../NVIDIA_Jetson_Xavier_NX/Docker/Dockerfile-5-SparkFun_RedBoard_Turbo \
       --build-arg BASE=aiwerkstatt/sensorbox/setup/flirlepton3.5:v1.0-ubuntu18 \
       --build-arg PLATFORM=host \
       --tag aiwerkstatt/sensorbox/setup/sparkfunredboardturbo:v1.0-ubuntu18 ../../SparkFun_RedBoard_Turbo 

# Sensor Suite
# ============
# requires SparkFun Redboard Turbo

DOCKER_BUILDKIT=1 sudo docker build -f ../../NVIDIA_Jetson_Xavier_NX/Docker/Dockerfile-6-Sensor_Suite \
       --build-arg BASE=aiwerkstatt/sensorbox/setup/sparkfunredboardturbo:v1.0-ubuntu18 \
       --tag aiwerkstatt/sensorbox/setup/sensorsuite:v1.0-ubuntu18 ../../SparkFun_RedBoard_Turbo

