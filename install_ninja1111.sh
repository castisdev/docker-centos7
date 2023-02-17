#!/bin/bash -e
set -x #echo on
cd ~
wget -nv --no-check-certificate --content-disposition https://github.com/skvadrik/re2c/releases/download/3.0/re2c-3.0.tar.xz
tar xvf re2c-3.0.tar.xz
cd re2c-3.0
mkdir .build && cd .build && cmake .. && cmake --build . -j$(nproc) --target install
cd ~
rm -rf re2c-3.0*

wget -nv https://github.com/ninja-build/ninja/archive/refs/tags/v1.11.1.tar.gz --no-check-certificate --content-disposition
tar xvf ninja-1.11.1.tar.gz
cd ninja-1.11.1
./configure.py --bootstrap
install ninja /usr/local/bin
cd ~
rm -rf ninja-*
ccache -C
