#!/usr/bin/env bash

WITH_MYSQL=${WITH_MYSQL:-0}
WITH_POSTGRESQL=${WITH_POSTGRESQL:-0}

rm -rf quickfix-python/C++
rm -rf quickfix-python/spec
rm -rf quickfix-python/quickfix*.py
rm -rf quickfix-python/doc
rm -rf quickfix-python/LICENSE
rm -rf quickfix-python/build

mkdir quickfix-python/C++
mkdir quickfix-python/spec

cp quickfix/LICENSE quickfix-python

cp quickfix/src/python3/*.py quickfix-python
cp quickfix/src/C++/*.h quickfix-python/C++
cp quickfix/src/C++/*.hpp quickfix-python/C++
cp quickfix/src/C++/*.cpp quickfix-python/C++
cp -R quickfix/src/C++/double-conversion quickfix-python/C++
cp quickfix/src/python3/QuickfixPython.cpp quickfix-python/C++
cp quickfix/src/python3/QuickfixPython.h quickfix-python/C++
cp README.md quickfix-python/

cp quickfix/spec/FIX*.xml quickfix-python/spec

touch quickfix-python/C++/config.h
touch quickfix-python/C++/config_windows.h
rm -f quickfix-python/C++/stdafx.*

cp -R quickfix/src/swig quickfix-python/C++

if ! [ -d .venv ]; then
  echo "Environment does not exist, creating ..."
  python -m venv .venv
  source .venv/bin/activate
  python -m pip install build twine
fi

pushd quickfix-python || exit

python3 -m build --sdist # source distribution
# python3 -m build --wheel # wheel distribution for current platform

# PYTHONWARNINGS="ignore" twine upload --repository-url https://test.pypi.org/legacy/ dist/*

popd || exit
