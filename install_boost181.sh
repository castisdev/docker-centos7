#!/bin/bash -e
set -x #echo on
yum -y install bzip2-devel which valgrind-devel; yum -y clean all
cd ~
wget -nv --no-check-certificate https://boostorg.jfrog.io/artifactory/main/release/1.81.0/source/boost_1_81_0.tar.gz
tar xzf boost_1_81_0.tar.gz
cd boost_1_81_0

./bootstrap.sh --prefix=/usr/local/boost_1_81_0
./b2 --without-python -j$(nproc) install

./bootstrap.sh --prefix=/usr/local/boost_1_81_0_valgrind
./b2 --without-python -j$(nproc) valgrind=on install

cd ~
rm -rf boost_*
ccache -C
