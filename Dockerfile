# Pull base image
FROM centos:7

LABEL org.opencontainers.image.source https://github.com/castisdev/docker-centos7

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
  openssl-devel \
  openssl-static \
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
  libwebp-devel \
  && yum -y clean all

ADD install_devtoolset11.sh /script/
RUN /script/install_devtoolset11.sh
SHELL [ "scl", "enable", "devtoolset-11" ]

ADD install_cmake3222.sh /script/
RUN /script/install_cmake3222.sh

ADD install_libbacktrace.sh /script/
RUN /script/install_libbacktrace.sh

ADD install_boost178.sh /script/
RUN /script/install_boost178.sh
ENV Boost_DIR /usr/local/boost_1_78_0

ADD install_cryptopp860.sh /script/
RUN /script/install_cryptopp860.sh

ADD install_googletest1110.sh /script/
RUN /script/install_googletest1110.sh

ADD install_python399.sh /script/
RUN /script/install_python399.sh

ADD install_cpptools.sh /script/
RUN /script/install_cpptools.sh

ADD install_cppcheck27.sh /script/
RUN /script/install_cppcheck27.sh

ADD install_zsh581.sh /script/
RUN /script/install_zsh581.sh

ADD install_ninja1102.sh /script/
RUN /script/install_ninja1102.sh

ADD install_ffmpeg50.sh /script/
RUN /script/install_ffmpeg50.sh

ADD install_golang1177.sh /script/
RUN /script/install_golang1177.sh

# set timezone
RUN ln -snf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# ctail
RUN wget -O - https://raw.githubusercontent.com/castisdev/ctail/master/install.sh --no-check-certificate | bash

# Add root files
ADD ./.bashrc /root/.bashrc

# Set environment variables
ENV HOME /root
ENV PATH="${PATH}:${HOME}/go/bin:/usr/local/go/bin"

# Define default command
CMD ["scl", "enable", "devtoolset-11", "zsh"]
