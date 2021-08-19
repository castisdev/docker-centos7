#!/bin/bash -e
set -x #echo on
cd ~
wget -nv https://github.com/google/googletest/archive/refs/tags/release-1.11.0.tar.gz
tar xvf release-1.11.0.tar.gz
cd googletest-release-1.11.0/
mkdir build;cd build;cmake ..;make install -j$(nproc)
cd ~
rm -rf release-1.11.0.tar.gz googletest*
