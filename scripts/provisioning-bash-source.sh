#!/bin/bash

[[ -f ~/.bashrc ]] || touch ~/.bashrc

source /etc/profile
source ~/.bashrc
source /root/.bashrc
source $HOME/.cargo/env

 vim --version
 node -v 
 npm -v 
 git --version
 go version
 pip3 --version
 yarn --version
 expo --version
