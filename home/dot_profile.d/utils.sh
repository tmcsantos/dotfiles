#!/usr/bin/env bash

usagesort() {
  du -h -d 1 "$1" | sort -k 1,1 -g
}

gql() {
    data=${1}
    curl -s -X POST "${2:-$SCHEMA_ENDPOINT}" --json "$(jq -c -n --arg query "$(cat "$data")" '{"query": $query}')"
}

if command -v fortune &>/dev/null; then
  if command -v cowsay &>/dev/null; then
    alias cclear="command clear && fortune | cowsay"
  else
    alias cclear="command clear && fortune"
  fi
fi

function free-port {
    comm -23 <(seq 49152 65535) <(lsof -nP -i | awk '{print $9}' | cut -d':' -f2 | cut -d'-' -f1 | grep "[0-9]\{1,5\}" | sort | uniq) | head -n 1
}

case "$(uname -s)" in
  Darwin*)
    used_ports() {
      netstat -Watnlv | grep LISTEN | awk '{"ps -ww -o args= -p " $9 | getline procname;colred="\033[01;31m";colclr="\033[0m"; print colred "proto: " colclr $1 colred " | addr.port: " colclr $4 colred " | pid: " colclr $9 colred " | name: " colclr procname;  }' | column -t -s "|"
    }

    cpu_check() {
      pmset -g therm
      sudo powermetrics --samplers smc -i1 -n1
    }
    ;;
esac

### Load .env files
dotenv() {
  local slashes=${PWD//[^\/]/}
  local directory="$PWD"
  for ((n = ${#slashes}; n > 0; --n)); do
    if [ -f "$directory/.env" ]; then
      set -o allexport
      source "$directory/.env"
      set +o allexport
      break
    fi
    directory=$(dirname "$directory")
  done
}
