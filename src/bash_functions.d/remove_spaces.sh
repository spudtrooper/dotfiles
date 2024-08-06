#!/bin/sh

for f in "$@"; do
  mv "$f" "$(echo $f | tr -d ' ')"
done
