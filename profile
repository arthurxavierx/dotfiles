# $DOTFILES
export DOTFILES=$HOME/Workspace/dotfiles

# $EDITOR
export EDITOR=nvim

# $PATH
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH
export PATH=$HOME/.stack/programs/x86_64-osx/ghc-8.0.2/bin:$PATH

# Android SDK
export ANDROID_HOME=~/Library/Android/sdk
export PATH=~/Library/Android/sdk/tools:~/Library/Android/sdk/platform-tools:$PATH

# nvm
export NVM_DIR="/Users/xavier/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export FZF_DEFAULT_COMMAND='
  (git ls-tree -r --name-only HEAD ||
   find . -path "*/\.*" -prune -o -type f -print -o -type l -print |
      sed s/^..//) 2> /dev/null'

export PATH="$PATH:$HOME/.bin"

# Aliases
# From: https://justin.abrah.ms/dotfiles/zsh.html

# Filesystem
alias ..='cd ..'           # Go up one directory
alias ...='cd ../..'       # Go up two directories
alias ....='cd ../../..'   # And for good measure
alias l='ls -lah'   # Long view, show hidden
alias la='ls -AF'   # Compact view, show hidden
alias ll='ls -lFh'  # Long view, no hidden

alias tmux='TERM=xterm-256color-italic \tmux'

# GIT ALIASES
alias g=git
alias ga='git add'
alias gb='git branch'
alias gba='git branch -a'
alias gc='git commit -v'
alias gch='git checkout'
alias gl='git pull'
alias gp='git push'
alias gr='git reset'
alias gs='git status'
alias gst='git stash'
alias gsta='git stash apply'
alias gd='git diff | $GIT_EDITOR -'
alias gmv='git mv'
alias gt='gtree | less -R'

# tree aliases
alias t='tree -C -I "node_modules|bower_components|output" | less -R'
