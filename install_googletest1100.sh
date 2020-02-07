#!/bin/bash -e
cd ~
wget https://github.com/google/googletest/archive/release-1.10.0.tar.gz
tar xvf release-1.10.0.tar.gz
cd googletest-release-1.10.0/
mkdir build;cd build;cmake ..;make install
cd ~
rm -rf release-1.10.0.tar.gz googletest*
