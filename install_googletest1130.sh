#!/bin/bash -e
set -x #echo on
cd ~
wget -nv --content-disposition https://github.com/google/googletest/archive/refs/tags/v1.13.0.tar.gz
tar xvf googletest-1.13.0.tar.gz
cd googletest-1.13.0/
mkdir build;cd build;cmake ..;make install -j$(nproc)
cd ~
rm -rf googletest-1.13.0.tar.gz googletest*
ccache -C
