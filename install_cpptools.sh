#!/bin/sh -e

cd ~
yum install -y python-pip; yum clean all -y
pip install gcovr

wget https://github.com/google/styleguide/raw/gh-pages/cpplint/cpplint.py --no-check-certificate
install cpplint.py /usr/local/bin/cpplint
rm -rf cpplint.py
