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
  sysstat; \
  yum -y clean all

ADD install_devtoolset6.sh /script/
RUN /script/install_devtoolset6.sh
ENV PATH /opt/rh/devtoolset-6/root/usr/bin/:$PATH

ADD install_cmake372.sh /script/
RUN /script/install_cmake372.sh

ADD install_boost159.sh /script/
RUN /script/install_boost159.sh
ENV BOOST_ROOT /usr/local/boost159

ADD install_cryptopp565.sh /script/
RUN /script/install_cryptopp565.sh

ADD install_googletest170.sh /script/
RUN /script/install_googletest170.sh

ADD install_python360.sh /script/
RUN /script/install_python360.sh

ADD install_cpptools.sh /script/
RUN /script/install_cpptools.sh

ADD install_cppcheck177.sh /script/
RUN /script/install_cppcheck177.sh

ADD install_zsh531.sh /script/
RUN /script/install_zsh531.sh

ADD install_ninja172.sh /script/
RUN /script/install_ninja172.sh

# set timezone
RUN ln -snf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# ctail
RUN wget -O - https://raw.githubusercontent.com/castisdev/ctail/master/install.sh --no-check-certificate | bash

# Add root files
ADD ./.bashrc /root/.bashrc

# Set environment variables
ENV HOME /root

# Define default command
CMD ["scl", "enable", "devtoolset-6", "zsh"]
