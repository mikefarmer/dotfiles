if [ -f ~/.bashrc_env_backup ]
then
  echo "skipping bashrc..."
else
  mv ~/.bashrc ~/.bashrc_env_backup
  echo "Linking bashrc"
  ln -s ~/tmp/dotfiles/bashrc ~/.bashrc
fi

if [ -f ~/.gemrc_env_backup ]
then
  echo "skipping gemrc..."
else
  mv ~/.gemrc ~/.gemrc_env_backup
  echo "Linking gemrc"
  ln -s ~/tmp/dotfiles/gemrc ~/.gemrc
fi

if [ -f ~/.gitconfig_env_backup ]
then
  echo "skipping gitconfig..."
else
  mv ~/.gitconfig ~/.gitconfig_env_backup
  echo "Linking gitconfig"
  ln -s ~/tmp/dotfiles/gitconfig ~/.gitconfig
fi

if [ -f ~/.githelpers_env_backup ]
then
  echo "skipping githelpers..."
else
  mv ~/.githelpers ~/.githelpers_env_backup
  echo "Linking githelpers"
  ln -s ~/tmp/dotfiles/githelpers ~/.githelpers
fi

if [ -f ~/.screenrc_env_backup ]
then
  echo "skipping screenrc..."
else
  mv ~/.screenrc ~/.screenrc_env_backup
  echo "Linking screenrc"
  ln -s ~/tmp/dotfiles/screenrc ~/.screenrc
fi

if [ -f ~/.tmux_env_backup ]
then
  echo "skipping tmux..."
else
  mv ~/.tmux.conf ~/.tmux_env_backup
  echo "Linking tmux.conf"
  ln -s ~/tmp/dotfiles/tmux.conf ~/.tmux.conf
fi

if [ -f ~/.vimrc_env_backup ]
then
  echo "skipping vimrc..."
else
  mv ~/.vimrc ~/.vimrc_env_backup
  echo "Linking vimrc"
  ln -s ~/tmp/dotfiles/vimrc ~/.vimrc
fi

if [ -f ~/.vim_env_backup ]
then
  echo "skipping vim..."
else
  mv ~/.vim ~/.vim_env_backup
  echo "Linking vim"
  ln -s ~/tmp/dotfiles/vim ~/.vim
fi

if [ -f ~/.psqlrc_backup ]
then
  echo "skipping psqlrc..."
else
  mv ~/.psqlrc ~/.psqlrc_backup
  echo "Linking psqlrc"
  ln -s ~/tmp/dotfiles/psqlrc ~/.psqlrc
fi

cp ~/tmp/dotfiles/env_settings ~/.env_settings
cp ~/tmp/dotfiles/env_override ~/.env_override

git submodule init
git submodule update

cd vim/bundle/command-t/ruby/command-t
ruby extconf.rb
make
cd ~/tmp/dotfiles

. ~/.bashrc
