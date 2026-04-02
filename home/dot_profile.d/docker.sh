#!/usr/bin/env bash

if [ -d /var/lib/docker ]; then
  alias docker-du='sudo du -h -d 1 "/var/lib/docker" | sort -k 1,1 -g'
fi

docker-clean() {
  docker rm -v "$(docker ps --filter=status=exited --filter=status=created -q)" 2>/dev/null
  docker rmi "$(docker images -a --filter=dangling=true -q)" 2>/dev/null
  docker volume rm "$(docker volume ls --filter=dangling=true -q)" 2>/dev/null
  return 0
}

docker-flush() {
  docker rm -v "$(docker ps -a -q)" 2>/dev/null
  docker rmi "$(docker images -a -q)" 2>/dev/null
  return 0
}
