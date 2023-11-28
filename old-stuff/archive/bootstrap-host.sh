#!/bin/bash
set -e

# unfinished

[ $# -ne 2 ] && echo "Usage: $0 <username> <hostname>" && exit 1

_strong="\033[1;97m"; _reset="\033[0m"

user="$1"
host="$2"
echo -e "Bootstrapping host ${_strong}${host}${_reset}\n"

ssh-keygen -R "${host}.local"

ssh-copy-id "${user}@${host}.local"
