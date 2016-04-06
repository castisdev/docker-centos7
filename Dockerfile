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
  cppcheck \
  subversion \
  tar \
  boost-devel \
  glibc-devel \
  libuuid-devel \
  gdb \
  golang \
  valgrind \
  mysql-devel \
  postgresql93-devel; \
  yum -y clean all

ADD ./install_devtoolset4.sh /script/
RUN /script/install_devtoolset4.sh
ENV PATH /opt/rh/devtoolset-4/root/usr/bin/:$PATH

ADD ./install_cmake351.sh /script/
RUN /script/install_cmake351.sh

ADD ./install_boost159.sh /script/
RUN /script/install_boost159.sh
ENV BOOST_ROOT /usr/local/boost159

ADD ./install_cryptopp563.sh /script/
RUN /script/install_cryptopp563.sh

ADD ./install_googletest170.sh /script/
RUN /script/install_googletest170.sh

ADD install_python351.sh /script/
RUN /script/install_python351.sh

ADD ./install_cpptools.sh /script/
RUN /script/install_cpptools.sh

# Add root files
ADD ./.bashrc /root/.bashrc

# Set environment variables
ENV HOME /root

# Define default command
CMD ["scl", "enable", "devtoolset-4", "bash"]
