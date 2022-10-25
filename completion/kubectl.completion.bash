#!/usr/bin/env bash

if [[ ! -f $BASH_COMPLETION_USER_DIR/completions/kubectl ]] && is_app_installed kubectl; then
  kubectl completion bash > $BASH_COMPLETION_USER_DIR/completions/kubectl
fi
