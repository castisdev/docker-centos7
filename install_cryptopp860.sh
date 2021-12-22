#!/bin/bash -e
set -x #echo on
cd ~
wget -nv --no-check-certificate https://www.cryptopp.com/cryptopp860.zip
unzip cryptopp860.zip -d cryptopp
cd cryptopp
sed -e s/march=native/march=x86-64/g GNUmakefile > tmp_make
mv -f tmp_make GNUmakefile
make static -j$(nproc)
make install -j$(nproc)
cd ~
rm -rf cryptopp*
