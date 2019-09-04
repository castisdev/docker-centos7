#!/bin/sh -e

cd ~
yum install -y python-pip; yum clean all -y
pip install gcovr cpplint
