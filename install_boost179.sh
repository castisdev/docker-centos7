#!/bin/bash -e
set -x #echo on
yum -y install bzip2-devel which valgrind-devel; yum -y clean all
cd ~
wget -nv --no-check-certificate https://boostorg.jfrog.io/artifactory/main/release/1.79.0/source/boost_1_79_0.tar.gz
tar xzf boost_1_79_0.tar.gz
cd boost_1_79_0

wget -nv --no-check-certificate https://www.boost.org/patches/1_79_0/0001-json-array-erase-relocate.patch
patch -p1 < 0001-json-array-erase-relocate.patch

./bootstrap.sh --prefix=/usr/local/boost_1_79_0
./b2 --without-python -j$(nproc) install
./b2 boost.locale.icu=off --with-locale -j$(nproc) install

./bootstrap.sh --prefix=/usr/local/boost_1_79_0_valgrind
./b2 --without-python -j$(nproc) valgrind=on install

cd ~
rm -rf boost_*
