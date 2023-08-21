#!/usr/bin/env bash

if [[ ! -f $BASH_COMPLETION_USER_DIR/completions/poetry ]] && is_app_installed poetry; then
  poetry completions bash >> $BASH_COMPLETION_USER_DIR/completions/poetry
fi
