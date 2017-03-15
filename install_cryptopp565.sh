#!/bin/bash -e
cd ~
wget --no-check-certificate https://www.cryptopp.com/cryptopp565.zip
unzip cryptopp565.zip -d cryptopp
cd cryptopp
sed -e s/march=native/march=x86-64/g GNUmakefile > tmp_make
mv -f tmp_make GNUmakefile
make static
make install
cd ~
rm -rf cryptopp*
