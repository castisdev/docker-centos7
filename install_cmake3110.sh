#!/bin/bash -e
cd ~
yum -y install ncurses-devel; yum -y clean all
wget --no-check-certificate https://cmake.org/files/v3.11/cmake-3.11.0.tar.gz
tar xzf cmake-3.11.0.tar.gz
cd cmake-3.11.0
./configure
make install
cmake --version
cd ~
rm -rf cmake-*
