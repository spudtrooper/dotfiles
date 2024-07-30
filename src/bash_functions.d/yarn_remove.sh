#!/bin/bash

if ! command -v yarn &>/dev/null; then
  brew add yarn
fi

for p in "$@"; do
  yarn remove "$p"
  yarn remove -D "@types/$p"
done
