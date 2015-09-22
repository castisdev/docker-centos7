#!/bin/sh -e
 
cd ~ 
wget https://bootstrap.pypa.io/get-pip.py --no-check-certificate
python get-pip.py
pip install gcovr
rm -rf get-pip.py

wget http://google-styleguide.googlecode.com/svn/trunk/cpplint/cpplint.py
install cpplint.py /usr/local/bin/cpplint
rm -rf cpplint.py

