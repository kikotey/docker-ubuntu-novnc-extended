#!/bin/bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
cat nvm_bash >> ~/.bash_profile
cat nvm_bash >> ~/.zshrc
source ~/.bashrc
#nvm ls-remote
nvm list
nvm install v14.21.2
nvm install v16.19.0
nvm use v14.21.2
node --version