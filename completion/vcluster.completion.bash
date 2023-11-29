#!/usr/bin/env bash

if [[ ! -f $BASH_COMPLETION_USER_DIR/completions/vcluster ]] && is_app_installed vcluster; then
  vcluster completion bash > $BASH_COMPLETION_USER_DIR/completions/vcluster
fi
