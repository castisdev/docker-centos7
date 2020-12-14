#!/bin/bash -e
set -x #echo on
cd ~
yum -y install epel-release; yum -y install re2c; yum -y clean all
wget https://github.com/ninja-build/ninja/archive/v1.10.2.tar.gz --no-check-certificate --content-disposition
tar xvf ninja-1.10.2.tar.gz
cd ninja-1.10.2
./configure.py --bootstrap
install ninja /usr/local/bin
cd ~
rm -rf ninja-*
