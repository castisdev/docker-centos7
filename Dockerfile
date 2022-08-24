# Pull base image
FROM centos:7

LABEL org.opencontainers.image.source https://github.com/castisdev/docker-centos7

# set timezone
RUN ln -snf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

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
  ccache \
  libunwind-devel \
  libasan \
  libasan-static \
  patch \
  && yum -y clean all

ADD install_devtoolset11.sh /script/
RUN /script/install_devtoolset11.sh
SHELL [ "scl", "enable", "devtoolset-11" ]

ADD install_cmake3241.sh /script/
RUN /script/install_cmake3241.sh

ADD install_libbacktrace.sh /script/
RUN /script/install_libbacktrace.sh

ADD install_boost180.sh /script/
RUN /script/install_boost180.sh
ENV Boost_DIR /usr/local/boost_1_80_0

ADD install_cryptopp870.sh /script/
RUN /script/install_cryptopp870.sh

ADD install_googletest1121.sh /script/
RUN /script/install_googletest1121.sh

ADD install_python3106.sh /script/
RUN /script/install_python3106.sh

ADD install_cpptools.sh /script/
RUN /script/install_cpptools.sh

ADD install_cppcheck28.sh /script/
RUN /script/install_cppcheck28.sh

ADD install_zsh59.sh /script/
RUN /script/install_zsh59.sh

ADD install_ninja1110.sh /script/
RUN /script/install_ninja1110.sh

ADD install_ffmpeg51.sh /script/
RUN /script/install_ffmpeg51.sh

ADD install_golang119.sh /script/
RUN /script/install_golang119.sh

ADD install_libwebp124.sh /script/
RUN /script/install_libwebp124.sh

ADD install_wrk420.sh /script/
RUN /script/install_wrk420.sh

ADD install_protobuf215.sh /script/
RUN /script/install_protobuf215.sh

# ctail
RUN wget -O - https://raw.githubusercontent.com/castisdev/ctail/master/install.sh --no-check-certificate | bash

# Add root files
ADD ./.bashrc /root/.bashrc

# Set environment variables
ENV HOME /root
ENV PATH="${PATH}:${HOME}/go/bin:/usr/local/go/bin"

# Define default command
CMD ["scl", "enable", "devtoolset-11", "zsh"]
