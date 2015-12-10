#!/bin/sh -e

cd ~
wget https://bootstrap.pypa.io/get-pip.py --no-check-certificate
python get-pip.py
pip install gcovr
rm -rf get-pip.py

wget https://github.com/google/styleguide/raw/gh-pages/cpplint/cpplint.py --no-check-certificate
install cpplint.py /usr/local/bin/cpplint
rm -rf cpplint.py
