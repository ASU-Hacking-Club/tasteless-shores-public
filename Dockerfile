FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y && apt-get install -y \
    libxcursor1 \
    libxinerama1 \
    libxrandr2 \
    libxi6 \
    libxcursor-dev \
    libxinerama-dev \
    libxrandr-dev \
    libxi-dev \
    libgl1 \
    libgl1-mesa-glx \
    libglu1-mesa \
    xvfb \ 
    unzip 

# setup the user
RUN useradd -s /bin/bash -m ctf
WORKDIR /home/ctf

# copy files
COPY ./public/* /home/ctf/
COPY ./private/* /home/ctf/
RUN chown ctf -R /home/ctf/ && unzip tasteless-shores.pck.zip 

USER ctf 

EXPOSE 31337
