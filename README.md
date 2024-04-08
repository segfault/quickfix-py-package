
# Scripts to package quickfix in Python

Based on https://github.com/quickfix/quickfix-package, original author: Oren Miller (oren@quickfixengine.org)

This project is an update to run with latest changes,
and compile and distribute a package in Python 3 with SSL support.

(Ruby is not supported as in the original project.)

# Why
The original package is not being maintained.

# Build Instructions

# On OSX

## Install Python using pyenv

Ensure you have g++, openssl, python-dev, autoconf, etc. (run ./setup-osx.sh if needed)
Ensure you are using the same Python version you would use in the application when building.

1. Uninstall the Python version you will use if installed:

```
pyenv uninstall 3.11.8
```

2. Install Python with compilation options to use the openssl version 1.1

```
export CONFIGURE_OPTS=--with-openssl=/opt/homebrew/opt/openssl@3
export LDFLAGS="$LDFLAGS -L/opt/homebrew/opt/openssl@3/lib"
export CPPFLAGS="$CPPFLAGS -I/opt/homebrew/opt/openssl@3/include -DHAVE_SSL=1"
export PYTHON_BUILD_HOMEBREW_OPENSSL_FORMULA=openssl@3

pyenv install 3.11.8
```

3. With the same Environment Variables, build the quickfix package.

```
export LDFLAGS="$LDFLAGS -L/opt/homebrew/opt/openssl@3/lib"
export CPPFLAGS="$CPPFLAGS -I/opt/homebrew/opt/openssl@3/include -DHAVE_SSL=1"
./build.sh
./package-python.sh
```

# On Ubuntu Linux

apt install swig

```
export LDFLAGS="-L/usr/lib/aarch64-linux-gnu"
export CPPFLAGS="-I/usr/include/openssl -DHAVE_SSL=1"
```
