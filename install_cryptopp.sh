#!/bin/bash -e
cd ~
wget http://www.cryptopp.com/cryptopp562.zip
unzip cryptopp562.zip -d cryptopp
cd cryptopp
sed -e s/march=native/march=x86-64/g GNUmakefile > tmp_make
mv tmp_make GNUmakefile
make static -j4
make install
cd ~
rm -rf cryptopp*

