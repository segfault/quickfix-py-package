
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

1. Setting Environment Variables flags to enable SSL:

```
export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include -DHAVE_SSL=1"
```

2. Build sources

```
./build.sh
```

This step will download quickfix source code from repository
https://github.com/pablodcar/quickfix and leave C++ and compiled objects into `quickfix` directory.

3. Use the C++ source code to update the Python package

```
./package-python.sh
```

# On Ubuntu Linux

check setup-ubuntu.sh or setup-yum.sh depending on your distributions' package manager
to see examples to install dependencies.

```
export LDFLAGS="-L/usr/lib/aarch64-linux-gnu"
export CPPFLAGS="-I/usr/include/openssl -DHAVE_SSL=1"
```
