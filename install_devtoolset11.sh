#!/bin/bash -e
set -x #echo on
yum install -y centos-release-scl-rh ; yum clean all -y
yum install -y devtoolset-11 devtoolset-11-gcc-c++ devtoolset-11-binutils devtoolset-11-libquadmath-devel devtoolset-11-gdb devtoolset-11-gdb-gdbserver devtoolset-11-perftools devtoolset-11-libasan-devel devtoolset-11-liblsan-devel devtoolset-11-libtsan-devel devtoolset-11-libubsan-devel devtoolset-11-valgrind-devel; yum clean all -y
