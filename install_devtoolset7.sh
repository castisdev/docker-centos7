#!/bin/bash -e
yum install -y centos-release-scl-rh ; yum clean all -y
yum install -y devtoolset-7-gcc-c++ devtoolset-7-binutils devtoolset-7-libquadmath-devel devtoolset-7-gdb devtoolset-7-gdb-server devtoolset-7-perftools devtoolset-7-libasan-devel; yum clean all -y
