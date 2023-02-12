#!/bin/bash

wget https://github.com/facebook/watchman/releases/download/v2023.02.06.00/watchman-v2023.02.06.00-linux.zip

unzip *.zip

cd watchman-v2023.02.06.00-linux
sudo mkdir -p /usr/local/{bin,lib} /usr/local/var/run/watchman
sudo cp bin/* /usr/local/bin
sudo cp lib/* /usr/local/lib
sudo chmod 755 /usr/local/bin/watchman
sudo chmod 2777 /usr/local/var/run/watchman
