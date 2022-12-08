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

#vim
 sudo apt -y update
 sudo apt search vim
 sudo apt-get -y install vim

source /etc/profile
source ~/.bashrc
source /root/.bashrc

#zip
sudo apt-get install -y zip unzip

#pip3
 sudo apt -y update
 sudo apt-get install -y python3-pip
 pip3 --version

#yarn
 echo y | npm install --global yarn
 yarn --version

#expo
 echo y | yarn global add expo-cli
 expo --version

# terraform
 wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
 echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
 sudo apt update && sudo apt-get -y install terraform

# ansible from pip3
 pip3 install --upgrade pip; \
 pip3 install --upgrade virtualenv; \
 pip3 install pywinrm[kerberos]; \
 pip3 install pywinrm; \
 pip3 install jmspath; \
 pip3 install requests; \
 python3 -m pip install ansible; \
 ansible-galaxy collection install azure.azcollection; \
 ansible-galaxy collection install amazon.aws; \
 pip3 install -r ~/.ansible/collections/ansible_collections/azure/azcollection/requirements-azure.txt

source /etc/profile
source ~/.bashrc
source /root/.bashrc
