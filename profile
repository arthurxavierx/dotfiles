# vim: fdm=marker:fdl=0:
export DOTFILES=$HOME/Workspace/dotfiles
export EDITOR=nvim

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# $PATH {{{
export PATH="$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH"
export PATH="$HOME/.stack/programs/x86_64-osx/ghc-8.0.2/bin:$PATH"
# Local binaries
export PATH="$PATH:$HOME/.bin"
# Python
export PATH="~/Library/Python/3.6/bin:$PATH"
# }}}

# Android SDK {{{
export ANDROID_HOME=~/Library/Android/sdk
export PATH=~/Library/Android/sdk/tools:~/Library/Android/sdk/platform-tools:$PATH
# }}}

# NVM {{{
export NVM_DIR="/Users/xavier/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
# }}}

# RVM {{{
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# }}}

# FZF {{{
export FZF_DEFAULT_COMMAND='
  (git ls-files ||
   find . -path "*/\.*" -prune -o -type f -print -o -type l -print |
      sed s/^..//) 2> /dev/null'
# }}}

# Google Cloud SDK {{{
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/luis/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/luis/Downloads/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/luis/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/luis/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
# }}}

# Aliases {{{
alias tmux='TERM=xterm-256color-italic \tmux'

# Filesystem {{{
alias ..='cd ..'           # Go up one directory
alias ...='cd ../..'       # Go up two directories
alias ....='cd ../../..'   # And for good measure
alias l='ls -lah'          # Long view, show hidden
alias la='ls -AF'          # Compact view, show hidden
alias ll='ls -lFh'         # Long view, no hidden
# }}}

# git {{{
alias g=git
alias ga='git add'
alias gb='git branch'
alias gba='git branch -a'
alias gc='git commit -v'
alias gch='git checkout'
alias gl='git log'
alias gp='git push'
alias gpo='git push -u origin'
alias gr='git reset'
alias gs='git status'
alias gst='git stash'
alias gsta='git stash apply'
alias gd='git diff'
alias gmv='git mv'
alias gt='lgtree'
# }}}

# tree {{{
alias t='ltree'
alias ta='ltree -a'
alias td='ltree -d'
alias tl='ltree -L'
alias tal='ltree -a -L'
alias tdl='ltree -d -L'

function ltree() {
  tree --ignore-case -C -I ".git|node_modules|bower_components|plugged" $@ | less -R
}

function lgtree() {
  gtree $@ | less -R
}
# }}}
# }}}
