#!/bin/bash -e
set -x #echo on
cd ~
wget -nv --content-disposition https://github.com/google/googletest/archive/refs/tags/v1.15.2.tar.gz
tar xvf googletest-1.15.2.tar.gz
cd googletest-1.15.2/
mkdir build;cd build;cmake ..;make install -j$(nproc)
cd ~
rm -rf googletest-1.15.2.tar.gz googletest*
