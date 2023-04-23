#!/bin/sh

for f in files/*; do
  dest="$HOME/.$(basename "$f")"
  cp $f $dest
done