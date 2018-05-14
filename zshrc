# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="mortalscumbag"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(gitfast brew gem rvm rails osx)

source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:$HOME/Dropbox/Development/Scripts"
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"
export GOPATH="$HOME/stukent/go"
export PATH="$PATH:$GOPATH/bin"

alias do-backup='cd /Volumes/Backup/Ongoing\ Backup/ && ./backup.sh'
alias ra="bin/rake"
alias rc="bin/rails console"
alias rr="bin/spring rails"
alias be="bundle exec"
alias vi='vim'

sk () { cd ~/stukent }
skb () { cd ~/stukent/borah/borah }
skbj () { cd ~/stukent/borah/borah/app/assets/javascripts }
skl () { cd ~/stukent/leatherman/leatherman }
skd () { cd ~/stukent/donaldson }
skh () { cd ~/stukent/hyndman }
ske () { cd ~/stukent/elbert }
skp () { cd ~/stukent/playbooks }
skg () { cd $GOPATH }
ska () { cd $GOPATH/src/github.com/stukent/altair }


sk_start () { cd ~/stukent/dev_general && goreman start }
sk_donald () { skd && goreman start }
sk_borah () { skb && goreman start }
sk_library () { cd ~/stukent/docker/library && docker-compose up }
sk_hyndman () { cd ~/stukent/hyndman && docker-compose up }

export EDIT='vim'
export EDITOR='vim'

export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export NVM_DIR="/Users/mikefarmer/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export DRONE_TOKEN="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0ZXh0IjoibWlrZWZhcm1lciIsInR5cGUiOiJ1c2VyIn0.xDMxCXUQWtUjzH3k3ZE68BzxbNd73PdDjHtnj_6MtAo"
export DRONE_SERVER="https://mon-drone.stukent.com"
