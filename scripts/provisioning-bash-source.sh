#!/bin/bash

[[ -f ~/.bashrc ]] || touch ~/.bashrc

source /etc/profile
source ~/.bashrc
source /root/.bashrc
source $HOME/.cargo/env

#vim
 sudo apt -y update
 sudo apt search vim
 sudo apt -y install vim
 
 vim --version
 node -v 
 npm -v 
 git --version
 go version
 pip3 --version
 yarn --version
 expo --version
