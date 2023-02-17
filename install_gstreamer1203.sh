#!/bin/bash -e
set -x #echo on
cd ~
pip3 install meson
yum -y install flex bison; yum -y clean all
wget -nv --no-check-certificate --content-disposition https://github.com/GStreamer/gstreamer/archive/refs/tags/1.20.3.tar.gz
tar xf gstreamer-1.20.3.tar.gz
cd gstreamer-1.20.3
export CFLAGS=$(pkg-config --cflags openssl11)
export LDFLAGS=$(pkg-config --libs openssl11)
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
meson -Dlibsoup:c_std=gnu99 build --prefix=/usr/local/gstreamer-1.20.3
meson install -C build
echo "/usr/local/gstreamer-1.20.3/lib64" >> /etc/ld.so.conf.d/gstreamer-1.20.3.conf
ldconfig
cd ~
rm -rf gstreamer-1.20.3*
ccache -C
