#!/bin/bash -e
set -x #echo on
cd ~
yum -y install tcl
yum -y clean all
wget -nv --no-check-certificate --content-disposition https://github.com/Haivision/srt/archive/refs/tags/v1.5.4.tar.gz
tar xvf srt-1.5.4.tar.gz
cd srt-1.5.4
PKG_CONFIG_PATH="/usr/local/openssl/lib64/pkgconfig:$PKG_CONFIG_PATH" ./configure
make install -j$(nproc)
echo "/usr/local/lib64" >> /etc/ld.so.conf.d/srt.conf
ldconfig
cd ~
rm -rf srt-1.5.4*
