#!/bin/bash -e
cd ~
wget https://cmake.org/files/v3.12/cmake-3.12.3-Linux-x86_64.sh --no-check-certificate
chmod +x cmake-3.12.3-Linux-x86_64.sh
./cmake-3.12.3-Linux-x86_64.sh --skip-license --prefix=/usr/local
cmake --version
cd ~
rm -rf cmake-*
