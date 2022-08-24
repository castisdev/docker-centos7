#!/bin/bash -e
set -x #echo on
yum -y install bzip2-devel which valgrind-devel; yum -y clean all
cd ~
wget -nv --no-check-certificate https://boostorg.jfrog.io/artifactory/main/release/1.80.0/source/boost_1_80_0.tar.gz
tar xzf boost_1_80_0.tar.gz
cd boost_1_80_0

wget -nv --no-check-certificate https://www.boost.org/patches/1_80_0/0001-filesystem-win-fix-dir-it-net-share.patch
patch -p1 < 0001-filesystem-win-fix-dir-it-net-share.patch

wget -nv --no-check-certificate https://www.boost.org/patches/1_80_0/0002-filesystem-fix-weakly-canonical-long-paths.patch
patch -p1 < 0002-filesystem-fix-weakly-canonical-long-paths.patch

./bootstrap.sh --prefix=/usr/local/boost_1_80_0
./b2 --without-python -j$(nproc) install
./b2 boost.locale.icu=off --with-locale -j$(nproc) install

./bootstrap.sh --prefix=/usr/local/boost_1_80_0_valgrind
./b2 --without-python -j$(nproc) valgrind=on install

cd ~
rm -rf boost_*
