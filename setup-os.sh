#!/usr/bin/env bash

BREW_BIN=$(which brew)
if [ -x "$BREW_BIN" ]; then
  brew update
  brew install autoconf libtool swig cmake ninja openssl@1.1
fi

YUM_BIN=$(which yum)
if [ -x "$YUM_BIN" ]; then
  yum update -y
  yum install openssl-devel cmake ninja-build swig -y

  echo "Config libs: ${pkg-config --libs openssl}"
fi

APT_GET_BIN=$(which apt-get)
if [ -x "$APT_GET_BIN" ]; then
  apt-get update -y
  apt-get install libssl-dev swig cmake ninja-build -y

  echo "Config libs: ${pkg-config --libs openssl}"
fi
