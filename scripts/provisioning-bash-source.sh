#!/bin/bash

[[ -f ~/.bashrc ]] || touch ~/.bashrc

source /etc/profile
source ~/.bashrc
source /root/.bashrc
source $HOME/.cargo/env