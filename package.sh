#!/usr/bin/env bash
QF_VERSION=0.0.10

rm -rf quickfix

cp -r ../quickfix quickfix
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
./configure --with-python2 --with-python3 --with-openssl && make && make check
popd || exit
