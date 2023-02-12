#!/bin/bash

nvm use v16.19.0
git clone https://github.com/facebook/flipper.git
cd flipper/desktop
yarn
yarn start
