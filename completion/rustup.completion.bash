#!/usr/bin/env bash

if [[ ! -f $BASH_COMPLETION_USER_DIR/completions/rustup ]] && is_app_installed rustup; then
  rustup completions bash > $BASH_COMPLETION_USER_DIR/completions/rustup
fi
