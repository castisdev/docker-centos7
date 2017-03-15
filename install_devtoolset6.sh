#!/bin/bash -e
yum install -y centos-release-scl-rh ; yum clean all -y
yum install -y devtoolset-6-gcc-c++ devtoolset-6-binutils devtoolset-6-libquadmath-devel devtoolset-6-gdb devtoolset-6-gdb-server; yum clean all -y
