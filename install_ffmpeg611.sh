#!/bin/bash -e
set -x #echo on
yum -y install libxml2-devel SDL2-devel alsa-lib-devel libXv-devel libX11-devel libXext-devel autoconf automake libtool yasm fontconfig-devel freetype-devel fribidi-devel harfbuzz-devel; yum -y clean all

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
wget -nv --no-check-certificate --content-disposition https://github.com/cisco/openh264/archive/refs/tags/v2.4.1.tar.gz
tar xf openh264-2.4.1.tar.gz
cd openh264-2.4.1
make install -j$(nproc)
cd ~
rm -rf openh264-2.4.1*

cd ~
git clone --branch stable --depth 1 https://code.videolan.org/videolan/x264.git
cd x264
PKG_CONFIG_PATH="/usr/local/lib/pkgconfig" ./configure --enable-shared
make install -j$(nproc)
cd ~
rm -rf x264*

cd ~
wget -nv --no-check-certificate --content-disposition https://github.com/xiph/opus/releases/download/v1.4/opus-1.4.tar.gz
tar xf opus-1.4.tar.gz
cd opus-1.4
./configure --enable-shared
make install -j$(nproc)
cd ~
rm -rf opus-1.4*

cd ~
wget -nv --no-check-certificate --content-disposition https://github.com/videolan/x265/archive/refs/tags/3.4.tar.gz
tar xvf x265-3.4.tar.gz
cd x265-3.4/build/linux
# ./make-Makefiles.bash
cmake -GNinja ../../source
ninja install
cd ~
rm -rf x265-3.4*

cd ~
wget -nv --no-check-certificate https://ffmpeg.org/releases/ffmpeg-6.1.1.tar.bz2
tar xf ffmpeg-6.1.1.tar.bz2
cd ffmpeg-6.1.1

PKG_CONFIG_PATH="/usr/local/openssl/lib64/pkgconfig:/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH" ./configure --enable-gpl --enable-version3 --enable-shared --enable-libxml2 --enable-openssl --enable-libopenh264 --enable-libopus --enable-libx264 --enable-libx265 --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libharfbuzz
make install -j$(nproc)
echo "/usr/local/lib" >> /etc/ld.so.conf.d/ffmpeg.conf

PKG_CONFIG_PATH="/usr/local/openssl/lib64/pkgconfig:/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH" ./configure --prefix=/usr/local/lib/ffmpeg_lgpl --enable-shared --enable-libxml2 --enable-openssl --enable-libopenh264 --enable-libopus --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libharfbuzz
make install -j$(nproc)

ldconfig

cd ~
rm -rf ffmpeg-6.1.1*
ccache -C
