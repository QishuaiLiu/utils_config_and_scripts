#! /usr/bin/bash

## install nodejs and yarn
curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -

sudo apt -y install nodejs
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install yarn -y

## install 
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update && sudo apt install neovim -y

