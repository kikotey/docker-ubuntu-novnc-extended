#!/bin/bash

mkdir -p ~/android/sdk
cd ~/android/sdk
wget https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip
sudo unzip commandlinetools-linux-9477386_latest.zip
cd cmdline-tools
mkdir -p tools
mv -i * tools

echo "export ANDROID_HOME=$HOME/android/sdk" > $HOME/.bashrc
echo "export ANDROID_HOME=$HOME/android/sdk" > $HOME/.bash_profile

echo "export PATH=$ANDROID_HOME/cmdline-tools/tools/bin/:$PATH" > $HOME/.bashrc
echo "export PATH=$ANDROID_HOME/cmdline-tools/tools/bin/:$PATH" > $HOME/.bash_profile

echo "export PATH=$ANDROID_HOME/emulator/:$PATH" > $HOME/.bashrc
echo "export PATH=$ANDROID_HOME/emulator/:$PATH" > $HOME/.bash_profile

echo "export PATH=$ANDROID_HOME/platform-tools/:$PATH" > $HOME/.bashrc
echo "export PATH=$ANDROID_HOME/platform-tools/:$PATH" > $HOME/.bash_profile

export ANDROID_HOME=$HOME/android/sdk
export PATH=$ANDROID_HOME/cmdline-tools/tools/bin/:$PATH
export PATH=$ANDROID_HOME/emulator/:$PATH
export PATH=$ANDROID_HOME/platform-tools/:$PATH

source $HOME/.bash_profile
source $HOME/.bashrc


sdkmanager --install "platform-tools" "emulator"
sdkmanager --install "platform-tools" "build-tools;33.0.0"
sdkmanager --install "platform-tools" "platforms;android-33"

yarn global add react-devtools

sudo apt install android-tools-adb android-tools-fastboot -y
sudo adb kill-server
sudo adb start-server
adb devices


