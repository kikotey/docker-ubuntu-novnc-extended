#!/bin/bash

#vim
 sudo apt -y update
 sudo apt search vim
 sudo apt -y install vim
 
#expo
 echo y | yarn global add expo-cli
 expo --version

source /etc/profile
source ~/.bashrc
source /root/.bashrc

 expo --version
