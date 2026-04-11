#!/usr/bin/env bash

set -euo pipefail

# Install TPM and plugins if not installed
if [ ! -e "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  # Install TPM Plugins
  TMUX_PLUGIN_MANAGER_PATH=~/.tmux/plugins "$HOME"/.tmux/plugins/tpm/bin/install_plugins
fi
