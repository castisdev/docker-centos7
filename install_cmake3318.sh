#!/bin/bash -e
set -x #echo on
cd ~
wget -nv https://github.com/Kitware/CMake/releases/download/v3.31.8/cmake-3.31.8-linux-x86_64.sh --no-check-certificate
chmod +x cmake-3.31.8-linux-x86_64.sh
./cmake-3.31.8-linux-x86_64.sh --skip-license --prefix=/usr/local
cmake --version
cd ~
rm -rf cmake-*
