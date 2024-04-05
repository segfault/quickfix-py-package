
# Scripts to package quickfix in python

Based on https://github.com/quickfix/quickfix-package, updated to run with latest changes
because the original package is not being maintained.

# Build Instructions

1. Clone quickfix repository on the parent directory:

```
pushd ..
git clone https://github.com/pablodcar/quickfix
popd
```

# On OSX

Ensure you have g++, openssl, python-dev, autoconf, etc. (run ./setup-osx.sh if needed)

```
export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include"
./package.sh
```
