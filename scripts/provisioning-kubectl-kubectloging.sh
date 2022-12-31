#/bin/bash

# view release https://github.com/int128/kubelogin/releases
wget https://github.com/Azure/kubelogin/releases/download/v0.0.25/kubelogin.zip
unzip kubelogin.zip
mv ./bin/linux_amd64/kubelogin /usr/bin
rm -Rf ./bin

#test 
kubelogin convert-kubeconfig
