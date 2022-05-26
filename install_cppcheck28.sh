#!/bin/bash -e
set -x #echo on
cd ~
yum -y install bzip2; yum -y clean all
wget -nv --no-check-certificate --content-disposition https://github.com/danmar/cppcheck/archive/2.8.tar.gz
tar xf cppcheck-2.8.tar.gz
cd cppcheck-2.8
mkdir build;cd build;cmake ..;make install -j$(nproc)
cd ~
rm -rf cppcheck*
