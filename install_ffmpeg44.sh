#!/bin/bash -e
set -x #echo on
yum -y install libxml2-devel SDL2-devel alsa-lib-devel libXv-devel libX11-devel libXext-devel autoconf automake libtool yasm nasm; yum -y clean all
cd ~
wget -nv --no-check-certificate https://ffmpeg.org/releases/ffmpeg-4.4.tar.bz2
tar xf ffmpeg-4.4.tar.bz2
cd ffmpeg-4.4

./configure --enable-libxml2 --enable-shared
make install -j$(nproc)
echo "/usr/local/lib" >> /etc/ld.so.conf.d/ffmpeg.conf
ldconfig

cd ~
rm -rf ffmpeg-4.4*
