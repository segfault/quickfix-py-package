#!/usr/bin/env bash
QF_VERSION=0.0.10

WITH_MYSQL=${WITH_MYSQL:-0}

arguments=(--with-python --with-openssl=/opt/homebrew/opt/openssl@1.1)
if [ "$WITH_MYSQL" -eq 1 ]; then
    arguments+=(--with-mysql)
fi

rm -rf quickfix

# git clone https://github.com/pablodcar/quickfix
cp -r ../quickfix .
rm -rf quickfix/.git

# pushd quickfix/doc
# ./document.sh
# popd

pushd quickfix || exit
./bootstrap
popd || exit

rm -f quickfix-$QF_VERSION.tar.gz

tar czvf quickfix-$QF_VERSION.tar.gz quickfix

pushd quickfix || exit
./configure "${arguments[@]}" && make
# make check
popd || exit

pushd quickfix/src/python || exit
# building Python interface
./swig.sh
popd || exit

