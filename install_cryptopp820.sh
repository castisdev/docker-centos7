#!/bin/bash -e
set -x #echo on
cd ~
wget --no-check-certificate https://www.cryptopp.com/cryptopp820.zip
unzip cryptopp820.zip -d cryptopp
cd cryptopp
sed -e s/march=native/march=x86-64/g GNUmakefile > tmp_make
mv -f tmp_make GNUmakefile
make static -j$(nproc)
make install
cd ~
rm -rf cryptopp*
