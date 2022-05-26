#!/bin/sh -e
set -x #echo on
cd ~
wget -nv --no-check-certificate --content-disposition https://github.com/protocolbuffers/protobuf/releases/download/v21.0/protoc-21.0-linux-x86_64.zip
unzip protoc-21.0-linux-x86_64.zip -d protoc-21.0-linux-x86_64
mv protoc-21.0-linux-x86_64/bin/* /usr/local/bin/
mv protoc-21.0-linux-x86_64/include/* /usr/local/include/
cd ~
rm -rf protoc-21.0-linux-x86_64*
