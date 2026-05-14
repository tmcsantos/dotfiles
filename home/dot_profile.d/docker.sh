#!/usr/bin/env bash

if [ -d /var/lib/docker ]; then
  alias docker-du='sudo du -h -d 1 "/var/lib/docker" | sort -k 1,1 -g'
fi
