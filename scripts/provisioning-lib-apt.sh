#!/bin/bash

[[ -f ~/.bashrc ]] || touch ~/.bashrc

source /etc/profile
source ~/.bashrc
source /root/.bashrc

 sudo apt -y update
 sudo apt -y upgrade

#dos2unix
sudo apt-get -y install dos2unix

#git
 sudo apt -y install git

#curl
 sudo apt -y install -y curl

#node
 curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
 sudo apt -y install -y nodejs

#rust
 curl https://sh.rustup.rs -sSf | sh -s -- -y
 source $HOME/.cargo/env

#vim
 sudo apt search vim
 sudo apt -y install vim

 vim --version
 node -v 
 npm -v 
 git --version
 go version

#yarn
 echo y | npm install --global yarn
 yarn --version

#expo
 echo y | yarn global add expo-cli
 expo --version

source /etc/profile
source ~/.bashrc
source /root/.bashrc


