#!/bin/sh -e
set -x #echo on

cd ~
yum -y install libxml2-devel libxslt-devel; yum -y clean all
pip3 install wheel
pip3 install gcovr cpplint
