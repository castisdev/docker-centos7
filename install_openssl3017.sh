#!/bin/bash -e
set -x #echo on
yum -y install perl-IPC-Cmd
yum -y clean all

cd ~
wget -nv --no-check-certificate https://github.com/openssl/openssl/archive/refs/tags/openssl-3.0.17.tar.gz
tar xf openssl-3.0.17.tar.gz
cd openssl-openssl-3.0.17
./config --prefix=/usr/local/openssl --openssldir=/usr/local/openssl shared
make -j$(nproc); make install
cd ~
rm -rf openssl-*
echo "/usr/local/openssl/lib64" > /etc/ld.so.conf.d/openssl.conf
ldconfig -v
