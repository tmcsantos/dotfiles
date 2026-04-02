#!/usr/bin/env bash

# avoid bash history duplicates..
export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=20000
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend
shopt -s autocd cdspell

# sync up history on all bash sessions
__bash_history_sync() {
  command history -a
  command history -r
  command history -n
  command history -w
}

# enable the starship prompt
if command -v starship &>/dev/null; then
  starship_precmd_user_func="__bash_history_sync"
  eval "$(starship init bash)"
fi
