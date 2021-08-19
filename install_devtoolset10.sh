#!/bin/bash -e
set -x #echo on
yum install -y centos-release-scl-rh ; yum clean all -y
yum install -y devtoolset-10 devtoolset-10-gcc-c++ devtoolset-10-binutils devtoolset-10-libquadmath-devel devtoolset-10-gdb devtoolset-10-gdb-gdbserver devtoolset-10-perftools devtoolset-10-libasan-devel devtoolset-10-liblsan-devel devtoolset-10-libtsan-devel devtoolset-10-libubsan-devel devtoolset-10-valgrind-devel; yum clean all -y
