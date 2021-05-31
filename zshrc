#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}


# --------------------
# Module configuration
# --------------------

#
# completion
#

# Set a custom path for the completion dump file.
# If none is provided, the default ${ZDOTDIR:-${HOME}}/.zcompdump is used.
#zstyle ':zim:completion' dumpfile "${ZDOTDIR:-${HOME}}/.zcompdump-${ZSH_VERSION}"

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=10'

# ------------------
# Initialize modules
# ------------------

if [[ ${ZIM_HOME}/init.zsh -ot ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  # Update static initialization script if it's outdated, before sourcing it
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Bind up and down keys
zmodload -F zsh/terminfo +p:terminfo
if [[ -n ${terminfo[kcuu1]} && -n ${terminfo[kcud1]} ]]; then
  bindkey ${terminfo[kcuu1]} history-substring-search-up
  bindkey ${terminfo[kcud1]} history-substring-search-down
fi

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

export EDIT='vim'
export EDITOR='vim'

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:$HOME/Dropbox/Development/Scripts"
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/11/bin"
export GOPATH="$HOME/stukent/go"
export PATH="$PATH:$GOPATH/bin"

# alias do-backup='cd /Volumes/Backup/Ongoing\ Backup/ && ./backup.sh'
alias ra="bin/rake"
alias rc="bin/rails console"
alias rr="bin/spring rails"
alias be="bundle exec"
alias vi='vim'
alias dc='docker-compose'
alias k=kubectl
alias ld='lazydocker'
alias dt='dotnet'
alias guid="uuidgen | tr '[:upper:]' '[:lower:]'"
alias guidc="uuidgen | tr -d '\n' | tr '[:upper:]' '[:lower:]' | pbcopy && pbpaste && echo"
alias yt="yarn test --browsers=ChromeHeadless"
alias vs="code ."
alias gfa="git fetch --all"

gitcleanup () {
  if [ `git branch | grep main` ]
  then
    echo "Using main"
    git checkout main
  else
    echo "Using master"
    git checkout master
  fi
  git pull
  git fetch -p && for branch in $(git branch -vv | grep ': gone]' | awk '{print $1}'); do git branch -D $branch; done
  git prune origin
  echo "Finished cleanup"
}

gitcleanups () {
  git stash
  gitcleanup
  git stash pop
}

checkel () {
  if (($# == 0));
  then
    echo "Usage: checkel [project, ...]"
  else
    echo 'Yarn build...'
    yarn build $@
    echo 'Yarn lint...'
    yarn lint $@
    echo 'Yarn test...'
    yarn test --no-watch --browsers=ChromeHeadless $@
  fi
}

sk () { cd ~/stukent }
skb () { cd ~/stukent/borah }
skd () { cd ~/stukent/donaldson }
ske () { cd ~/stukent/SimulationElements }
skm () { cd ~/stukent/MimicApp }
skp () { cd ~/stukent/sk-proxy && ./start && popd }
skg () { cd $GOPATH }
ska () { cd $GOPATH/src/github.com/Stukent/altair }

# docker command completions
# etc=/Applications/Docker.app/Contents/Resources/etc
# ln -s $etc/docker.zsh-completion /usr/local/share/zsh/site-functions/_docker
# ln -s $etc/docker-compose.zsh-completion /usr/local/share/zsh/site-functions/_docker-compose


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
