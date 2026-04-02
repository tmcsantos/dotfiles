#!/usr/bin/env bash

# enable fzf autocompletion and key-bindings if found
if command -v fzf >/dev/null; then
  source <(fzf --bash)
fi

# list directories of interest
__list_tracked_dirs() {
  local tracked_directories=(
    "$HOME/projects"
    "$HOME/work"
    "$HOME/journal"
    "$HOME/services"
    "$HOME/playground"
  )

  local targets=()
  for target in "${tracked_directories[@]}"; do
    [[ -d $target ]] && targets+=("$target")
  done
  echo "${targets[@]}"
}

# Use ~~ as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER='~~'

export FZF_CTRL_T_COMMAND="command find $(__list_tracked_dirs) -maxdepth 2 -type d"

# Options to fzf command
export FZF_DEFAULT_OPTS="--border -1 --reverse --preview='[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --color=always {} || cat {}) 2>/dev/null | head -300' --preview-window='right:hidden:wrap' --bind='f3:execute(bat {} || less -f {}),f2:toggle-preview,ctrl-d:half-page-down,ctrl-u:half-page-up'"

_fzf_complete_ssh_notrigger() {
    FZF_COMPLETION_TRIGGER='' _fzf_host_completion
}

_fzf_complete_kill_notrigger() {
    FZF_COMPLETION_TRIGGER='' _fzf_complete_kill
}

# disabling ssh finder for now, doesn't find hosts defined outside of config.d
# complete -o bashdefault -o default -F _fzf_complete_ssh_notrigger ssh
complete -o bashdefault -o default -F _fzf_complete_kill_notrigger kill

# Customize how fzf handles certain commands
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)             fzf "$@" --preview 'tree -C {} | head -200' ;;
    export | unset) fzf "$@" --preview "eval 'echo \$'{}" ;;
    ssh)            fzf "$@" --preview 'dig {}' ;;
    *)              fzf "$@" ;;
  esac
}
