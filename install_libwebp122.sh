#!/bin/bash -e
set -x #echo on
cd ~
wget -nv https://github.com/webmproject/libwebp/archive/refs/tags/v1.2.2.tar.gz --no-check-certificate --content-disposition
tar xvf libwebp-1.2.2.tar.gz
cd libwebp-1.2.2
./autogen.sh
./configure
make install -j$(nproc)
ldconfig
cd ~
rm -rf libwebp-*
