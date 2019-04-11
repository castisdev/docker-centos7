#!/bin/bash -e
cd ~
git clone https://github.com/ianlancetaylor/libbacktrace.git
cd libbacktrace
CFLAGS=-fPIC ./configure
make install
cd ~
rm -rf libbacktrace
