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

# Update Symlinks for gcc/g++ to GCC-7
sudo update-alternatives --config gcc
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 60 \
                         --slave /usr/bin/g++ g++ /usr/bin/g++-7

git submodule update --init --recursive

echo "Now installing Font Fira Code"
sudo apt install fonts-firacode
wget https://github.com/tonsky/FiraCode/files/412440/FiraCode-Regular-Symbol.zip -O /tmp/fira-code-symbols.zip
sudo unzip /tmp/fira-code-symbols.zip -d /usr/share/fonts/opentype/
sudo fc-cache -f -v   # Refresh the font cache


if [ -d "ccls" ]; then
  echo "Now building CCLS C/C++ Language Server"
  cd ccls || return
  if [ -d llvm ]; then rm -Rf llvm; fi
  mkdir -p llvm && cd llvm || return
  LLVM_BASENAME="clang+llvm-9.0.0-$(uname -m)-linux-gnu-ubuntu-$(lsb_release -rs)"
  wget "https://releases.llvm.org/9.0.0/${LLVM_BASENAME}.tar.xz"
  tar -xf "${LLVM_BASENAME}.tar.xz"
  cd ..
  cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH="./llvm/${LLVM_BASENAME}"
  cmake --build Release -- "-j$(nproc)"

else
    echo "No ccls folder found. Was the submodule cloned successfully? Skipping CCLS installation"
fi
