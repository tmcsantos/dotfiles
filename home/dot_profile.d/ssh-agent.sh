#!/usr/bin/env bash

if ! pgrep -U "$USER" ssh-agent >/dev/null; then
  eval "$(ssh-agent)"
fi

if [ -z "$SSH_CONNECTION" ] && [ -S "$SSH_AUTH_SOCK" ] && [ "$SSH_AUTH_SOCK" != "$HOME/.ssh/auth.sock" ]; then
  ln -sf "$SSH_AUTH_SOCK" "$HOME/.ssh/auth.sock"
fi
