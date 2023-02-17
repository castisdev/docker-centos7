#!/bin/sh -e
set -x #echo on

cd ~
yum install -y zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel libffi-devel; yum clean all -y
wget -nv https://www.python.org/ftp/python/3.11.0/Python-3.11.0.tar.xz
tar xf Python-3.11.0.tar.xz
cd Python-3.11.0
export CFLAGS=$(pkg-config --cflags openssl11)
export LDFLAGS=$(pkg-config --libs openssl11)
./configure --prefix=/usr/local
make install -j$(nproc)
cd ~
rm -rf Python-*
ccache -C

pip3 install -U pip setuptools websocket-client
