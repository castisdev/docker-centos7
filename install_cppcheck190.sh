#!/bin/bash -e
cd ~
yum -y install bzip2; yum -y clean all
wget --no-check-certificate --content-disposition https://github.com/danmar/cppcheck/archive/1.90.tar.gz
tar xf cppcheck-1.90.tar.gz
cd cppcheck-1.90
mkdir build;cd build;cmake ..;make install
cd ~
rm -rf cppcheck*
