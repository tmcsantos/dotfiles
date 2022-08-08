#!/usr/bin/env bash

languages=`echo "golang java rust python nodejs typescript cpp c tmux jq" | tr ' ' '\n'`
core_utils=`echo "xargs find sed awk grep tr" | tr ' ' '\n'`

selected=`printf "$languages\n$core_utils" | fzf`

[[ -z $selected ]] && exit 0

cht_sh="curl cht.sh/$selected"

if printf "$languages" | grep -qs $selected; then
    read -p "query: " query
    query=$(echo $query | tr ' ' '+')
    cht_sh="$cht_sh/$query"
elif printf "$core_utils" | grep -qs $selected; then
    read -p "operation: " operation
    cht_sh="$cht_sh~$operation"
fi

if [[ -z $TMUX ]]; then
    $cht_sh
else
    tmux neww bash -c "$cht_sh & while [ : ]; do sleep 1; done"
fi
