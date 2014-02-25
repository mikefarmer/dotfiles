#!/bin/bash
set -e

cd ~/tmp
wget ftp://ftp.vim.org/pub/vim/unix/vim-7.3.tar.bz2
tar -jxvf vim-7.3.tar.bz2
cd vim73
./configure --enable-rubyinterp --enable-pythoninterp --prefix=$HOME/tmp/custom_vim --with-features=big
make && make install
cd ..
rm -rf vim73
rm vim-7.3.tar.bz2
cd ~/tmp/dotfiles
