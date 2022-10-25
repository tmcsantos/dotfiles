#!/usr/bin/env bash

if [ "$NVM_DIR" ] && [ -r "$NVM_DIR"/bash_completion ]; then
  check_dotfile $BASH_COMPLETION_USER_DIR/completions/nvm "$NVM_DIR"/bash_completion
fi
