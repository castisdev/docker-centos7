#!/bin/bash -e
yum install -y centos-release-scl-rh ; yum clean all -y
yum install -y devtoolset-8 devtoolset-8-gcc-c++ devtoolset-8-binutils devtoolset-8-libquadmath-devel devtoolset-8-gdb devtoolset-8-gdb-gdbserver devtoolset-8-perftools devtoolset-8-libasan-devel devtoolset-8-liblsan-devel devtoolset-8-libtsan-devel devtoolset-8-libusan-devel; yum clean all -y
