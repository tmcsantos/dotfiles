#!/usr/bin/env bash

if [[ $- =~ i ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_TTY" ]]; then
    tmux attach-session || tmux new-session -s ssh_tmux
fi
