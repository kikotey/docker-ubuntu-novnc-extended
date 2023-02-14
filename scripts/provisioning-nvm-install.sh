#!/bin/bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
cat nvm-bashrc >> ~/.bash_profile
cat nvm-bashrc >> ~/.zshrc
source ~/.bashrc
#nvm ls-remote
nvm list

if [[ $(nvm list | grep v14.21.2) == "" ]]; then
  nvm install v14.21.2
else
  nvm use v14.21.2
fi

if [[ $(nvm ls | grep v16.19.0) == "" ]]; then
  nvm install v16.19.0
fi

node --version
