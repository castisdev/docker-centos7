#!/bin/bash -e
cd ~
wget https://github.com/google/googletest/archive/release-1.8.1.tar.gz
tar xvf release-1.8.1.tar.gz 
cd googletest-release-1.8.1/
mkdir build;cd build;cmake ..;make install
cd ~
rm -rf release-1.8.1.tar.gz googletest*
