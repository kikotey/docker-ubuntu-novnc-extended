#!/bin/bash
pub_file="/home/ubuntu/.ssh/id_rsa.pub"
dest="/root/.ssh"
src="/home/ubuntu/.ssh"
if [ ! -f $pub_file ]
then
    echo "ssh files does not exist in ~/.ssh"
    ssh-keygen -q -t rsa -N '' -f $src/id_rsa <<<y >/dev/null 2>&1 && mkdir -p $dest && cp -R $src/* $dest
    echo "new ssh key is created in ~/.ssh and past in the /root/.ssh folder"
    ls $dest $src
else
    echo "ssh files already exist in ~/.ssh"
    mkdir -p $dest && cp -R $src $dest
fi
