#!/bin/bash -e
set -x #echo on
yum -y install libxml2-devel SDL2-devel alsa-lib-devel libXv-devel libX11-devel libXext-devel autoconf automake libtool yasm; yum -y clean all

cd ~
wget -nv --no-check-certificate https://www.nasm.us/pub/nasm/releasebuilds/2.16.01/nasm-2.16.01.tar.bz2
tar xf nasm-2.16.01.tar.bz2
cd nasm-2.16.01
./autogen.sh
./configure
make install -j$(nproc)
cd ~
rm -rf nasm-2.16.01*

cd ~
wget -nv --no-check-certificate --content-disposition https://github.com/cisco/openh264/archive/refs/tags/v2.3.1.tar.gz
tar xf openh264-2.3.1.tar.gz
cd openh264-2.3.1
make install -j$(nproc)
cd ~
rm -rf openh264-2.3.1*

cd ~
git clone --branch stable --depth 1 https://code.videolan.org/videolan/x264.git
cd x264
PKG_CONFIG_PATH="/usr/local/lib/pkgconfig" ./configure --enable-shared
make install -j$(nproc)
cd ~
rm -rf x264*

cd ~
wget -nv --no-check-certificate --content-disposition https://archive.mozilla.org/pub/opus/opus-1.3.1.tar.gz
tar xf opus-1.3.1.tar.gz
cd opus-1.3.1
./configure --enable-shared
make install -j$(nproc)
cd ~
rm -rf opus-1.3.1*

cd ~
wget -nv --no-check-certificate https://ffmpeg.org/releases/ffmpeg-6.0.tar.bz2
tar xf ffmpeg-6.0.tar.bz2
cd ffmpeg-6.0

PKG_CONFIG_PATH=/usr/local/lib/pkgconfig ./configure --enable-shared --enable-libxml2 --enable-libopenh264 --enable-libopus
make install -j$(nproc)
echo "/usr/local/lib" >> /etc/ld.so.conf.d/ffmpeg.conf

PKG_CONFIG_PATH=/usr/local/lib/pkgconfig ./configure --prefix=/usr/local/lib/ffmpeg_gpl --enable-gpl --enable-shared --enable-libxml2 --enable-libopenh264 --enable-libopus --enable-libx264
make install -j$(nproc)

ldconfig

cd ~
rm -rf ffmpeg-6.0*
ccache -C
