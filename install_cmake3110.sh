#!/bin/bash -e
cd ~
wget https://cmake.org/files/v3.11/cmake-3.11.0-Linux-x86_64.sh --no-check-certificate
chmod +x cmake-3.11.0-Linux-x86_64.sh
./cmake-3.11.0-Linux-x86_64.sh --skip-license --prefix=/usr/local
cmake --version
cd ~
rm -rf cmake-*
