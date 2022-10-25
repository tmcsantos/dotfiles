#!/usr/bin/env bash

if [[ ! -f $BASH_COMPLETION_USER_DIR/completions/helm ]] && is_app_installed helm; then
  helm completion bash > $BASH_COMPLETION_USER_DIR/completions/helm
fi
