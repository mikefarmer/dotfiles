export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:$HOME/Dropbox/Development/Scripts"
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# alias do-backup='cd /Volumes/Backup/Ongoing\ Backup/ && ./backup.sh'
alias ra="bin/rake"
alias rc="bin/rails console"
alias rr="bin/spring rails"
alias be="bundle exec"
alias vi='vim'
alias dc='docker-compose'
alias k=kubectl
alias ytl='yarn test:local'
alias yl='yarn eslint'
alias ld='lazydocker'
alias rapi='yarn db:reset && ./cli.js upsert_client_auth0 1 TYp6LGCOH4EsFm6FSCUCqWbKRud2ThbQ google-oauth2 http://localhost:3000/login/callback Google && ./cli.js generate_canvas_client internal && ./cli.js seed_permissions'

am () { cd ~/ambi }
apin () { cd ~/ambi/ambi-api-next }
webn () { cd ~/ambi/ambi-web-next }

# sk () { cd ~/stukent }
# skb () { cd ~/stukent/borah/borah }
# skbj () { cd ~/stukent/borah/borah/app/assets/javascripts }
# skl () { cd ~/stukent/leatherman/leatherman }
# skd () { cd ~/stukent/donaldson }
# skh () { cd ~/stukent/hyndman }
# ske () { cd ~/stukent/elbert }
# skp () { cd ~/stukent/playbooks }
# skg () { cd $GOPATH }
# ska () { cd $GOPATH/src/github.com/stukent/altair }
#
#
# sk_start () { cd ~/stukent/dev_general && goreman start }
# sk_donald () { skd && goreman start }
# sk_borah () { skb && goreman start }
# sk_library () { cd ~/stukent/docker/library && docker-compose up }
# sk_hyndman () { cd ~/stukent/hyndman && docker-compose up }

export EDIT='vim'
export EDITOR='vim'


#
# User configuration sourced by interactive shells
#

# Define zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion
if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi
if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi
