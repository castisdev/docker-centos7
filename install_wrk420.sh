#!/bin/sh -e
set -x #echo on
cd ~
wget -nv --no-check-certificate --content-disposition https://github.com/wg/wrk/archive/refs/tags/4.2.0.tar.gz
tar xvf wrk-4.2.0.tar.gz
cd wrk-4.2.0
make -j$(nproc)
cp wrk /usr/local/bin/
cd ~
rm -rf wrk-4.2.0*
