#!/bin/bash

sudo install firefox-dev-edition-update /usr/local/sbin/
sudo firefox-dev-edition-update -i
cp -a firefoxDevEdition.desktop /usr/share/applications/
sudo mkdir -p /etc/firefox/policies
cp -a policies.json /etc/firefox/policies/
