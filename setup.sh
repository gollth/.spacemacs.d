#!/bin/sh

sudo apt update
sudo apt install build-essential cmake python3-dev

git submodule update --init --recursive

if [ -d "ycmd" ]; then
    cd ycmd
    git submodule update --init --recursive
    python build.py --clang-completer
fi

echo "Now installing Font Fira Code"
sudo apt install fonts-firacode
wget https://github.com/tonsky/FiraCode/files/412440/FiraCode-Regular-Symbol.zip -O /tmp/fira-code-symbols.zip
sudo unzip /tmp/fira-code-symbols.zip -d /usr/share/fonts/opentype/
sudo fc-cache -f -v   # Refresh the font cache
