# vim: ft=sh:fdm=marker:fdl=0:
alias tmux='TERM=xterm-256color-italic \tmux'

alias vi='nvim'

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
alias gpo='git push -u origin $(git rev-parse --abbrev-ref HEAD)'
alias gr='git reset'
alias gs='git status'
alias gst='git stash'
alias gsta='git stash apply'
alias gd='git diff'
alias gdw='git diff -w'
alias gds='git diff --staged'
alias gdh='git diff HEAD'
alias gdh1='git diff HEAD~1'
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

# IRC {{{
function ircnew() {
  for out in $(find ~/irc -name out -print)
  do
    cp /dev/null $out
  done
  irc
}

alias virc='pushd ~/irc && vi . && popd'
# }}}

function stackid() {
  ghcid --command="stack repl $@ --ghc-options='-O0'"
}
