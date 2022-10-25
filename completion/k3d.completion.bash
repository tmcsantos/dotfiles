#!/usr/bin/env bash

if [[ ! -f $BASH_COMPLETION_USER_DIR/completions/k3d ]] && is_app_installed k3d; then
  k3d completion bash > $BASH_COMPLETION_USER_DIR/completions/k3d
fi
