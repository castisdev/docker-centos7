#!/bin/bash -e
yum -y install bzip2-devel which; yum -y clean all
cd ~
wget --no-check-certificate http://sourceforge.net/projects/boost/files/boost/1.69.0/boost_1_69_0.tar.gz
tar xzf boost_1_69_0.tar.gz
cd boost_1_69_0
./bootstrap.sh --prefix=/usr/local/boost_1_69_0
./b2 --without-python install
./b2 boost.locale.icu=off --with-locale install
cd ~
rm -rf boost_*
