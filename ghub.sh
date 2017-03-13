#!/usr/bin/env bash

# funcs
repo_addr() {
  echo "$(git remote -v | grep '^origin.*(push)$' | awk '{ print $2 }')"
}

webpage() {
  if hash browser; then
    browser "$1"
  else
    open "$1"
}

main() {
  # get repo info
  if [ -d "$1/.git" ]; then
    # get address
    addr=$(repo_addr)
    # open webpage
    webpage "$addr"
  else
    echo "This is not a git repository"
}


# run main
if [ -z "$1" ]; then
  main "$PWD"
else
  main "$PWD/$1"
fi
