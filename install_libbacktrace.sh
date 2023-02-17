#!/bin/bash -e
set -x #echo on
cd ~
git clone https://github.com/ianlancetaylor/libbacktrace.git
cd libbacktrace
CFLAGS=-fPIC ./configure
make install -j$(nproc)
cd ~
rm -rf libbacktrace
ccache -C
