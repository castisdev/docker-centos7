#!/bin/sh -e
set -x #echo on
cd ~
wget -nv --no-check-certificate --content-disposition https://github.com/protocolbuffers/protobuf/releases/download/v25.3/protoc-25.3-linux-x86_64.zip
unzip protoc-25.3-linux-x86_64.zip -d protoc-25.3-linux-x86_64
mv protoc-25.3-linux-x86_64/bin/* /usr/local/bin/
mv protoc-25.3-linux-x86_64/include/* /usr/local/include/
cd ~
rm -rf protoc-25.3-linux-x86_64*
ccache -C
