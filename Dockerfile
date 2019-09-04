# Pull base image
FROM centos:7

# Install EPEL repo
RUN yum install -y epel-release; yum -y clean all

# Install
RUN yum install -y \
  sudo \
  wget \
  gcc \
  gcc-c++ \
  make \
  unzip \
  openssl-devel \
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
  net-tools; \
  yum -y clean all

ADD install_devtoolset8.sh /script/
RUN /script/install_devtoolset8.sh
ENV PATH /opt/rh/devtoolset-8/root/usr/bin/:$PATH

ADD install_cmake3152.sh /script/
RUN /script/install_cmake3152.sh

ADD install_libbacktrace.sh /script/
RUN /script/install_libbacktrace.sh

ADD install_boost171.sh /script/
RUN /script/install_boost171.sh
ENV BOOST_ROOT /usr/local/boost_1_71_0

ADD install_cryptopp820.sh /script/
RUN /script/install_cryptopp820.sh

ADD install_googletest181.sh /script/
RUN /script/install_googletest181.sh

ADD install_python374.sh /script/
RUN /script/install_python374.sh

ADD install_cpptools.sh /script/
RUN /script/install_cpptools.sh

ADD install_cppcheck189.sh /script/
RUN /script/install_cppcheck189.sh

ADD install_zsh571.sh /script/
RUN /script/install_zsh571.sh

ADD install_ninja190.sh /script/
RUN /script/install_ninja190.sh

# set timezone
RUN ln -snf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# ctail
RUN wget -O - https://raw.githubusercontent.com/castisdev/ctail/master/install.sh --no-check-certificate | bash

# Add root files
ADD ./.bashrc /root/.bashrc

# Set environment variables
ENV HOME /root

# Define default command
CMD ["scl", "enable", "devtoolset-8", "zsh"]
