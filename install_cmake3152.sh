#!/bin/bash -e
cd ~
wget https://github.com/Kitware/CMake/releases/download/v3.15.2/cmake-3.15.2-Linux-x86_64.sh --no-check-certificate
chmod +x cmake-3.15.2-Linux-x86_64.sh
./cmake-3.15.2-Linux-x86_64.sh --skip-license --prefix=/usr/local
cmake --version
cd ~
rm -rf cmake-*
