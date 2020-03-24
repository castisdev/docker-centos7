#!/bin/bash -e
yum -y install libxml2-devel SDL2-devel alsa-lib-devel libXv-devel libX11-devel libXext-devel autoconf automake libtool; yum -y clean all
cd ~
wget --no-check-certificate https://ffmpeg.org/releases/ffmpeg-4.2.2.tar.bz2
tar xf ffmpeg-4.2.2.tar.bz2
cd ffmpeg-4.2.2

./configure --disable-x86asm --enable-libxml2
make install

cd ~
rm -rf ffmpeg-4.2.2
