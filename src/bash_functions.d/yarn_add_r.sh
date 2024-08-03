#!/bin/bash

# Check if a directory was provided as an argument
DIR=.
if [ ! -z "$1" ]; then
  DIR=$1
fi

PKGS=$(grep -r import $DIR | awk -Ffrom '{print $2}' | sed "s/'//g" | sed 's/"//g' | sed 's/;//g' | grep -v "./" | sort | uniq)
yarn add $PKGS
for PKG in $PKGS; do
  yarn add $PKG
done
