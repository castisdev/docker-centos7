# Pull base image
FROM nvidia/cuda:12.4.0-devel-centos7

LABEL org.opencontainers.image.source https://github.com/castisdev/docker-centos7

# set timezone
RUN ln -snf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

RUN sed -i s/mirror.centos.org/vault.centos.org/g /etc/yum.repos.d/*.repo
RUN sed -i s/^#.*baseurl=http/baseurl=http/g /etc/yum.repos.d/*.repo
RUN sed -i s/^mirrorlist=http/#mirrorlist=http/g /etc/yum.repos.d/*.repo

# Install EPEL repo
RUN yum install -y epel-release; yum -y clean all

RUN yum install -y http://opensource.wandisco.com/centos/7/git/x86_64/wandisco-git-release-7-2.noarch.rpm; yum -y clean all

# Install
RUN yum install -y \
  sudo \
  wget \
  gcc \
  gcc-c++ \
  make \
  unzip \
  openssl \
  openssl-devel \
  openssl-static \
  openssl11 \
  openssl11-devel \
  openssl11-static \
  git \
  subversion \
  tar \
  boost-devel \
  glibc-devel \
  libuuid-devel \
  gdb \
  gdb-gdbserver \
  valgrind \
  mysql-devel \
  postgresql93-devel \
  curl-devel \
  xz \
  file \
  vim-enhanced \
  unixODBC-devel \
  mysql-connector-odbc \
  sysstat \
  psmisc \
  sysvinit-tools \
  yum-utils \
  tbb-devel \
  gperftools-devel \
  iproute \
  net-tools \
  libunwind-devel \
  libasan \
  libasan-static \
  patch \
  && yum -y clean all

ADD install_devtoolset11.sh /script/
RUN /script/install_devtoolset11.sh
SHELL [ "scl", "enable", "devtoolset-11" ]
ENV BUILD_TOOLSET_ENABLE=/opt/rh/devtoolset-11/enable

ADD install_cmake3318.sh /script/
RUN /script/install_cmake3318.sh

ADD install_libbacktrace.sh /script/
RUN /script/install_libbacktrace.sh

ADD install_boost187.sh /script/
RUN /script/install_boost187.sh
ENV Boost_DIR /usr/local/boost_1_87_0

ADD install_cryptopp890.sh /script/
RUN /script/install_cryptopp890.sh

ADD install_googletest1152.sh /script/
RUN /script/install_googletest1152.sh

ADD install_python3125.sh /script/
RUN /script/install_python3125.sh

ADD install_cpptools.sh /script/
RUN /script/install_cpptools.sh

ADD install_cppcheck2180.sh /script/
RUN /script/install_cppcheck2180.sh

ADD install_zsh59.sh /script/
RUN /script/install_zsh59.sh

ADD install_ninja1131.sh /script/
RUN /script/install_ninja1131.sh

ADD install_openssl3017.sh /script/
RUN /script/install_openssl3017.sh

ADD install_srt154.sh /script/
RUN /script/install_srt154.sh

ADD install_ffmpeg703.sh /script/
RUN /script/install_ffmpeg703.sh

ADD install_golang1246.sh /script/
RUN /script/install_golang1246.sh

# Set environment variables
ENV HOME /root
ENV PATH="${PATH}:${HOME}/go/bin:/usr/local/go/bin"

ADD install_libwebp140.sh /script/
RUN /script/install_libwebp140.sh

ADD install_wrk420.sh /script/
RUN /script/install_wrk420.sh

ADD install_protobuf273.sh /script/
RUN /script/install_protobuf273.sh

# ctail
RUN wget -O - https://raw.githubusercontent.com/castisdev/ctail/master/install.sh --no-check-certificate | bash

# Add root files
ADD ./.bashrc /root/.bashrc

# Define default command
CMD ["scl", "enable", "devtoolset-11", "zsh"]
