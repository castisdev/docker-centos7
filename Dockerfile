# Pull base image
FROM centos:7

RUN yum install -y epel-release; yum -y clean all

# Install EPEL repo
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
  && yum -y clean all

ADD install_devtoolset9.sh /script/
RUN /script/install_devtoolset9.sh
SHELL [ "scl", "enable", "devtoolset-9" ]

ADD install_cmake3202.sh /script/
RUN /script/install_cmake3202.sh

ADD install_libbacktrace.sh /script/
RUN /script/install_libbacktrace.sh

ADD install_boost176.sh /script/
RUN /script/install_boost176.sh
ENV Boost_DIR /usr/local/boost_1_76_0

ADD install_cryptopp850.sh /script/
RUN /script/install_cryptopp850.sh

ADD install_googletest1100.sh /script/
RUN /script/install_googletest1100.sh

ADD install_python395.sh /script/
RUN /script/install_python395.sh

ADD install_cpptools.sh /script/
RUN /script/install_cpptools.sh

ADD install_cppcheck241.sh /script/
RUN /script/install_cppcheck241.sh

ADD install_zsh58.sh /script/
RUN /script/install_zsh58.sh

ADD install_ninja1102.sh /script/
RUN /script/install_ninja1102.sh

ADD install_ffmpeg44.sh /script/
RUN /script/install_ffmpeg44.sh

# set timezone
RUN ln -snf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# ctail
RUN wget -O - https://raw.githubusercontent.com/castisdev/ctail/master/install.sh --no-check-certificate | bash

# Add root files
ADD ./.bashrc /root/.bashrc

# Set environment variables
ENV HOME /root

# Define default command
CMD ["scl", "enable", "devtoolset-9", "zsh"]
