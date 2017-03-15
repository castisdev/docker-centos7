# Pull base image
FROM centos:7

# Install EPEL repo
RUN yum install -y epel-release

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
  git \
  subversion \
  tar \
  boost-devel \
  glibc-devel \
  libuuid-devel \
  gdb \
  golang \
  valgrind \
  mysql-devel \
  postgresql93-devel \
  curl-devel \
  xz \
  file; \
  yum -y clean all

ADD ./install_devtoolset6.sh /script/
RUN /script/install_devtoolset6.sh
ENV PATH /opt/rh/devtoolset-6/root/usr/bin/:$PATH

ADD ./install_cmake372.sh /script/
RUN /script/install_cmake372.sh

ADD ./install_boost159.sh /script/
RUN /script/install_boost159.sh
ENV BOOST_ROOT /usr/local/boost159

ADD ./install_cryptopp565.sh /script/
RUN /script/install_cryptopp565.sh

ADD ./install_googletest170.sh /script/
RUN /script/install_googletest170.sh

ADD install_python360.sh /script/
RUN /script/install_python360.sh

ADD ./install_cpptools.sh /script/
RUN /script/install_cpptools.sh

ADD install_cppcheck177.sh /script/
RUN /script/install_cppcheck177.sh

ADD install_zsh531.sh /script/
RUN /script/install_zsh531.sh

ADD install_ninja172.sh /script/
RUN /script/install_ninja172.sh

# Add root files
ADD ./.bashrc /root/.bashrc

# Install
RUN yum install -y \
  vim-enhanced; \
  yum -y clean all

# Set environment variables
ENV HOME /root

# Define default command
CMD ["scl", "enable", "devtoolset-6", "zsh"]
