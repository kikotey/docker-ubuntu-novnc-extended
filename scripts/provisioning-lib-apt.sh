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
 sudo apt-get -y install git

#curl
 sudo apt-get -y install -y curl

#node
 curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
 sudo apt-get -y install -y nodejs

#rust
 curl https://sh.rustup.rs -sSf | sh -s -- -y

#zip
 sudo apt-get install -y zip unzip

#pip3
 sudo apt -y update
 sudo apt-get install -y python3-pip
 pip3 --version

#yarn
 echo y | npm install --global yarn
 yarn --version

#telnet
 sudo apt-get -y update 
 sudo apt-get install -y telnet

#fuser
 sudo apt-get install -y psmisc

#netstat
 sudo apt -y update
 sudo apt install -y net-tools

