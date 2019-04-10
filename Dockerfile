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

ADD install_cmake3141.sh /script/
RUN /script/install_cmake3141.sh

ADD install_libbacktrace.sh /script/
RUN /script/install_libbacktrace.sh

ADD install_boost169.sh /script/
RUN /script/install_boost169.sh
ENV BOOST_ROOT /usr/local/boost_1_69_0

ADD install_cryptopp700.sh /script/
RUN /script/install_cryptopp700.sh

ADD install_googletest181.sh /script/
RUN /script/install_googletest181.sh

ADD install_python371.sh /script/
RUN /script/install_python371.sh

ADD install_cpptools.sh /script/
RUN /script/install_cpptools.sh

ADD install_cppcheck185.sh /script/
RUN /script/install_cppcheck185.sh

ADD install_zsh562.sh /script/
RUN /script/install_zsh562.sh

ADD install_ninja182.sh /script/
RUN /script/install_ninja182.sh

# set timezone
RUN ln -snf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# ctail
RUN wget -O - https://raw.githubusercontent.com/castisdev/ctail/master/install.sh --no-check-certificate | bash

# Add root files
ADD ./.bashrc /root/.bashrc

# Set environment variables
ENV HOME /root

# Define default command
CMD ["scl", "enable", "devtoolset-7", "zsh"]
