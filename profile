# vim: ft=sh:fdm=marker:fdl=0:
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

source ~/.aliases
