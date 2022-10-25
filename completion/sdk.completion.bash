#!/usr/bin/env bash


if [[ ! -f $BASH_COMPLETION_USER_DIR/completions/sdk ]] && [ "$SDKMAN_DIR" ]; then
  check_dotfile $BASH_COMPLETION_USER_DIR/completions/sdk "$SDKMAN_DIR"/contrib/completion/bash/sdk
  echo "sdkman_auto_completE=false" > $SDKMAN_DIR/etc/config
fi
