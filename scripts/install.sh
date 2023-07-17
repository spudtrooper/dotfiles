#!/bin/sh

for f in src/*; do
  dest="$HOME/.$(basename "$f")"
  cp $f $dest
done