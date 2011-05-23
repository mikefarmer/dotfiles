cd ~/tmp
wget ftp://ftp.vim.org/pub/vim/unix/vim-7.3.tar.bz2
tar -jxvf vim-7.3.tar.bz2
cd vim73
configure ./configure --enable-rubyinterp --prefix=$HOME/tmp/custom_vim
make && make install
rm -rf vim73
rm -r vim-7.3.tar.bz2
