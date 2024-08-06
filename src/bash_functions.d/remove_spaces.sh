#!/bin/sh

for f in "$@"; do
  mv "$f" "$(echo $f | sed 's/[  ]//g')"
done
