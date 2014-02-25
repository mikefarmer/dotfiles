#!/bin/bash
set -e

cd ~/tmp
wget ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2
tar -jxvf vim-7.4.tar.bz2
cd vim74
./configure --enable-rubyinterp --enable-pythoninterp --prefix=$HOME/tmp/custom_vim --with-features=big
make && make install
cd ..
rm -rf vim74
rm vim-7.4.tar.bz2
cd ~/tmp/dotfiles
