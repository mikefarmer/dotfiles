# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="mortalscumbag"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(gitfast rbenv brew gem)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:
export PATH=$PATH:/Users/mikefarmer/Dropbox/Development/Scripts
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
export PATH="$HOME/tmp/dropbox:$PATH"
eval "$(rbenv init -)"

# ls Aliases
alias la='ls -a'


#shortcut editors
alias vi='~/tmp/custom_vim/bin/vim'
alias vim='vi'

# Open in existing vim
alias v='vi --remote-silent'

# rails specific
alias reload-db-test='rake db:drop RAILS_ENV=test && rake db:bootstrap RAILS_ENV=test'
alias reload-db='rake db:drop && rake db:bootstrap'
alias be='bundle exec'


alias do-log='tail -f log/development.log | egrep -v "/assets/"'
#alias do-backup='cd /Volumes/Backup/Ongoing\ Backup/ && ./backup.sh'
#alias ep-vitrue='ssh vitrue-dev'
#alias ep='cd /Users/mikefarmer/Dropbox/endpoint;ll'
#alias dev='cd /Users/mikefarmer/Dropbox/Development;ll'

#if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export EDIT='vim'
export EDITOR='vim'


