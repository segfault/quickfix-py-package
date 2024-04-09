
# Scripts to package quickfix in Python

Based on https://github.com/quickfix/quickfix-package, original author: Oren Miller (oren@quickfixengine.org)

This project is an update to run with latest changes,
and compile and distribute a package in Python 3 with SSL support.

# Why

The original package is not being maintained.

# Build Instructions

# On OSX

## Install Python using pyenv

Ensure you have g++, openssl, python-dev, autoconf, etc. (run ./setup-osx.sh if needed)
Ensure you are using the same Python version you would use in the application when building.

1. Setting Environment Variables, build the quickfix package.

```
export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include -DHAVE_SSL=1"
./build.sh
./package-python.sh
```

# On Ubuntu Linux

check setup-ubuntu.sh or setup-yum.sh depending on your distributions' package manager
to see examples to install dependencies.

```
export LDFLAGS="-L/usr/lib/aarch64-linux-gnu"
export CPPFLAGS="-I/usr/include/openssl -DHAVE_SSL=1"
```
