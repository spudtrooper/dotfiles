#!/bin/bash

if ! command -v yarn &>/dev/null; then
  brew add yarn
fi

for p in "$@"; do
  yarn add "$p"
  yarn add -D "@types/$p"
done
