#!/bin/sh -e
sed -i -e 's/Defaults    requiretty.*/ #Defaults    requiretty/g' /etc/sudoers
cd ~
wget --no-check-certificate --content-disposition http://sourceforge.net/projects/zsh/files/zsh/5.5/zsh-5.5.tar.xz/download
tar xvf zsh-5.5.tar.xz
cd zsh-5.5
./configure --with-tcsetpgrp
make
sudo make install
echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/zsh
cd ~
rm -rf zsh-*
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
