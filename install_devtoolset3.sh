#!/bin/bash -e
yum install -y scl-utils ; yum clean all -y
wget https://www.softwarecollections.org/en/scls/rhscl/devtoolset-3/epel-7-x86_64/download/rhscl-devtoolset-3-epel-7-x86_64.noarch.rpm
yum install -y rhscl-devtoolset-3-*.noarch.rpm ; yum clean all -y
rm rhscl-devtoolset-3-*.noarch.rpm
yum install -y devtoolset-3-gcc-c++ ; yum clean all -y
yum install -y devtoolset-3-binutils ; yum clean all -y
