#!/usr/bin/env bash

if ! pgrep --list-full --uid "$USER" --exact ssh-agent >/dev/null; then
  eval "$(ssh-agent)"
fi
