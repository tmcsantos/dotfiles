#!/usr/bin/env bash

if [[ ! -f $BASH_COMPLETION_USER_DIR/completions/cargo ]] && is_app_installed rustup; then
  rustup completions bash cargo > $BASH_COMPLETION_USER_DIR/completions/cargo
fi
