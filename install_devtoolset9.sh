#!/bin/bash -e
set -x #echo on
yum install -y centos-release-scl-rh ; yum clean all -y
yum install -y devtoolset-9 devtoolset-9-gcc-c++ devtoolset-9-binutils devtoolset-9-libquadmath-devel devtoolset-9-gdb devtoolset-9-gdb-gdbserver devtoolset-9-perftools devtoolset-9-libasan-devel devtoolset-9-liblsan-devel devtoolset-9-libtsan-devel devtoolset-9-libubsan-devel devtoolset-9-valgrind-devel; yum clean all -y
