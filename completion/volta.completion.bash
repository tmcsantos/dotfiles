#!/usr/bin/env bash

if [[ ! -f $BASH_COMPLETION_USER_DIR/completions/volta ]] && is_app_installed volta; then
  volta completions bash > $BASH_COMPLETION_USER_DIR/completions/volta
fi


