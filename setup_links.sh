#!/bin/bash
set -e




if [ -f ~/.gemrc_env_backup ]
then
  echo "skipping gemrc..."
else
  if [ -f ~/.gemrc ]
  then
    mv ~/.gemrc ~/.gemrc_env_backup
  fi
  echo "Linking gemrc"
  ln -s ~/tmp/dotfiles/gemrc ~/.gemrc
fi

if [ -f ~/.gitconfig_env_backup ]
then
  echo "skipping gitconfig..."
else
  if [ -f ~/.gitconfig ]
  then
    mv ~/.gitconfig ~/.gitconfig_env_backup
  fi
  echo "Linking gitconfig"
  ln -s ~/tmp/dotfiles/gitconfig ~/.gitconfig
fi

if [ -f ~/.githelpers_env_backup ]
then
  echo "skipping githelpers..."
else
  if [ -f ~/.githelpers ]
  then
    mv ~/.githelpers ~/.githelpers_env_backup
  fi
  echo "Linking githelpers"
  ln -s ~/tmp/dotfiles/githelpers ~/.githelpers
fi

if [ -f ~/.screenrc_env_backup ]
then
  echo "skipping screenrc..."
else
  if [ -f ~/.screenrc ]
  then
    mv ~/.screenrc ~/.screenrc_env_backup
  fi  
  echo "Linking screenrc"
  ln -s ~/tmp/dotfiles/screenrc ~/.screenrc
fi

if [ -f ~/.tmux_env_backup ]
then
  echo "skipping tmux..."
else
  if [ -f ~/.tmux.conf ]
  then
    mv ~/.tmux.conf ~/.tmux_env_backup
  fi
  echo "Linking tmux.conf"
  ln -s ~/tmp/dotfiles/tmux.conf ~/.tmux.conf
fi

if [ -f ~/.vimrc_env_backup ]
then
  echo "skipping vimrc..."
else
  if [ -f ~/.vimrc ]
  then
    mv ~/.vimrc ~/.vimrc_env_backup
  fi  
  echo "Linking vimrc"
  ln -s ~/tmp/dotfiles/vimrc ~/.vimrc
fi

if [ -f ~/.vim_env_backup ]
then
  echo "skipping vim..."
else
  if [ -f ~/.vim ]
  then
    mv ~/.vim ~/.vim_env_backup
  fi
  echo "Linking vim"
  ln -s ~/tmp/dotfiles/vim ~/.vim
fi

if [ -f ~/.psqlrc_env_backup ]
then
  echo "skipping psqlrc..."
else
  if [ -f ~/.psqlrc ]
  then
    mv ~/.psqlrc ~/.psqlrc_env_backup
  fi
  echo "Linking psqlrc"
  ln -s ~/tmp/dotfiles/psqlrc ~/.psqlrc
fi

