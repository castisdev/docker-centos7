#!/bin/bash -e
cd ~
git clone https://github.com/ianlancetaylor/libbacktrace.git
cd libbacktrace
./configure
make install
cd ~
rm -rf libbacktrace
