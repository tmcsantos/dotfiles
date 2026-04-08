#!/usr/bin/env bash

if ! pgrep -U "$USER" ssh-agent >/dev/null; then
  eval "$(ssh-agent)"
fi
