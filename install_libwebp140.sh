#!/bin/bash -e
set -x #echo on
cd ~
wget -nv https://github.com/webmproject/libwebp/archive/refs/tags/v1.4.0.tar.gz --no-check-certificate --content-disposition
tar xvf libwebp-1.4.0.tar.gz
cd libwebp-1.4.0
./autogen.sh
./configure
make install -j$(nproc)
ldconfig
cd ~
rm -rf libwebp-*
ccache -C
