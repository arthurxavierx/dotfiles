# vim:ft=zsh ts=2 sw=2 sts=2

# Based on 'agnoster' and 'pure'

# Begin a segment
# Takes two arguments, background and foreground. Both can be omitted,
# rendering default background/foreground.
prompt_segment() {
  local bg fg
  [[ -n $1 ]] && fg="%F{$1}" || fg="%f"
  echo -n "%{$bg%}%{$fg%}"
  [[ -n $2 ]] && echo -n "$2 "
}

# End the prompt, closing any open segments
prompt_end() {
  echo -n "%{%f%}"
}

prompt_newline() {
  echo -n "\n%{\r%}"
}

# Context: user@hostname (who am I and where am I)
prompt_context() {
  local color
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    [[ $UID -eq 0 ]] && color=yellow || color=default
    prompt_segment color "%(!.%{%F{yellow}%}.)$USER@%m"
  fi
}

# Git: branch/detached head, dirty status
prompt_git() {
  (( $+commands[git] )) || return
  local PL_BRANCH_CHAR
  local ref dirty mode repo_path
  repo_path=$(git rev-parse --git-dir 2>/dev/null)

  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    PL_BRANCH_CHAR=''
    () {
      local LC_ALL="" LC_CTYPE="en_US.UTF-8"
      [[ $(git branch -r | wc -l) -gt 0 ]] && PL_BRANCH_CHAR=$'\ue0a0 '  # 
    }

    dirty=$(parse_git_dirty)
    ref=$(git symbolic-ref HEAD 2> /dev/null) || ref="➦ $(git rev-parse --short HEAD 2> /dev/null)"
    if [[ -n $dirty ]]; then
      prompt_segment yellow
    else
      prompt_segment green
    fi

    if [[ -e "${repo_path}/BISECT_LOG" ]]; then
      mode=" <B>"
    elif [[ -e "${repo_path}/MERGE_HEAD" ]]; then
      mode=" >M<"
    elif [[ -e "${repo_path}/rebase" || -e "${repo_path}/rebase-apply" || -e "${repo_path}/rebase-merge" || -e "${repo_path}/../.dotest" ]]; then
      mode=" >R>"
    fi

    setopt promptsubst
    autoload -Uz vcs_info

    zstyle ':vcs_info:*' enable git
    zstyle ':vcs_info:*' get-revision true
    zstyle ':vcs_info:*' check-for-changes true
    zstyle ':vcs_info:*' stagedstr '+'
    zstyle ':vcs_info:*' unstagedstr '•'
    zstyle ':vcs_info:*' formats '%u%c'
    zstyle ':vcs_info:*' actionformats '%u%c'
    vcs_info
    echo -n "[${PL_BRANCH_CHAR}${ref/refs\/heads\//}${vcs_info_msg_0_%%}${mode}] "
  fi
}

# Dir: current working directory
prompt_dir() {
  # TODO: optimize this
  # prompt_segment blue '%~'
  # prompt_segment blue $(pwd | sed -E -e "s|^$HOME|~|" -e 's|^([^/]*/[^/]*/).*(/[^/]*/[^/]*)|\1..\2|')
  prompt_segment blue $(pwd | perl -pe "
    BEGIN {
      binmode STDIN, ':encoding(UTF-8)';
      binmode STDOUT, ':encoding(UTF-8)';
    }; s|^$HOME|~|; s|/([^/])[^/]*(?=/[^/]*/)|/\$1|g;")
}

# Virtualenv: current working virtualenv
prompt_virtualenv() {
  local virtualenv_path="$VIRTUAL_ENV"
  if [[ -n $virtualenv_path && -n $VIRTUAL_ENV_DISABLE_PROMPT ]]; then
    prompt_segment magenta "(`basename $virtualenv_path`)"
  fi
}

prompt_jobs() {
  local js=$(jobs -l | wc -l)
  if [[ js -gt 0 ]]; then
    prompt_segment cyan "%{%F{cyan}%}☯ $(echo -e $js | sed -e 's/^[[:space:]]*//')"
  fi
}

prompt_symbol() {
  local prompt_status
  prompt_status="%{%F{magenta}%}"
  [[ $RETVAL -ne 0 ]] && prompt_status="%{%F{red}%}"

  [[ -n "$prompt_status" ]] && echo -n "${prompt_status}${PROMPT_SYMBOL:-$}"
}

## Main prompt
build_prompt() {
  RETVAL=$?

  prompt_newline
  prompt_virtualenv
  # prompt_context
  prompt_dir
  prompt_git
  prompt_jobs

  prompt_newline
  prompt_symbol
  prompt_end
}

PROMPT='%{%f%b%k%}$(build_prompt) '
