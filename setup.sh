#!/bin/sh

sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt update
sudo apt install -y \
     build-essential \
     cmake \
     g++-7 \
     python3-pip \
     python3-dev \
     silversearcher-ag \
     software-properties-common \
     xclip

git submodule update --init --recursive

echo "Now installing Font Fira Code"
sudo apt install fonts-firacode
wget https://github.com/tonsky/FiraCode/files/412440/FiraCode-Regular-Symbol.zip -O /tmp/fira-code-symbols.zip
sudo unzip /tmp/fira-code-symbols.zip -d /usr/share/fonts/opentype/
sudo fc-cache -f -v   # Refresh the font cache
