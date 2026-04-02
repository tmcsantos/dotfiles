#!/usr/bin/env bash

# setup gpg-agent ssh
# launch gpg-agent if not up
if ! pgrep -u "$USER" gpg-agent >/dev/null; then
  eval "$(gpg-agent --daemon)"
fi
