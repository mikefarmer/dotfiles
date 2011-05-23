mv ~/.bashrc ~/.bashrc_original
ln -s ~/tmp/dotfiles/bashrc ~/.bashrc
mv ~/.gemrc ~/.gemrc_original
ln -s ~/tmp/dotfiles/gemrc ~/.gemrc
mv ~/.gitconfig ~/.gitconfig_original
ln -s ~/tmp/dotfiles/gitconfig ~/.gitconfig
mv ~/.screenrc ~/.screenrc_original
ln -s ~/tmp/dotfiles/screenrc ~/.screenrc
mv ~/.vimrc ~/.vimrc_original
ln -s ~/tmp/dotfiles/vimrc ~/.vimrc
mv ~/.vim ~/.vim_original
ln -s ~/tmp/dotfiles/vim ~/.vim

cp ~/tmp/dotfiles/default_bash ~/.default_bash

git submodule init
git submodule update

cd ~/tmp
wget ftp://ftp.vim.org/pub/vim/unix/vim-7.3.tar.bz2
tar -jxvf vim-7.3.tar.bz2
cd vim73
configure ./configure --enable-rubyinterp --prefix=$HOME/tmp/custom_vim
make && make install
