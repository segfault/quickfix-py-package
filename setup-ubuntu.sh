#!/usr/bin/env bash

apt install build-essential software-properties-common -y
add-apt-repository ppa:deadsnakes/ppa
apt update
apt install git
apt install autoconf
apt install libtool
apt install g++
apt install python3.11 -y
apt install python3.11-dev -y
apt install libssl-dev -y
apt install swig -y