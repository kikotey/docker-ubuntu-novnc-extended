#!/bin/bash

sudo apt-get --purge -y autoremove firefox
sudo rm -Rf /root/.mozilla/
sudo rm /etc/firefox/
sudo rm -Rf /etc/firefox/
sudo rm -Rf /usr/lib/firefox
sudo rm -Rf /usr/lib/firefox-addons/

sudo install firefox-dev-edition-update /usr/local/sbin/
sudo firefox-dev-edition-update -i
cp -a firefoxDevEdition.desktop /usr/share/applications/
sudo mkdir -p /etc/firefox/policies
cp -a policies.json /etc/firefox/policies/
