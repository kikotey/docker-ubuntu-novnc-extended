#/bin/bash

echo Y | sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo apt-get install -y powerline fonts-powerline
sudo apt-get install -y language-pack-en
sudo update-locale
cp -a ./.zshrc.ori ~/.zshrc
source ~/.zshrc



echo "go to https://github.com/kikotey/ohmyzsh; https://www.nealshah.dev/posts/2020/06/kubernetes-for-oh-my-zsh ; for custom "