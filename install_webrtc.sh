#!/bin/bash -e
set -x #echo on
yum -y install meson; yum -y clean all

cd ~
wget -nv --no-check-certificate --content-disposition https://github.com/libnice/libnice/archive/refs/tags/0.1.19.tar.gz
tar xf libnice-0.1.19.tar.gz
cd libnice-0.1.19
meson build
ninja -C build install
echo "/usr/local/lib64" >> /etc/ld.so.conf.d/webrtc.conf
ldconfig
cd ~
rm -rf libnice-0.1.19*
