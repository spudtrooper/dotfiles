#!/bin/sh
#
# Prints the list of dependencies and devDependencies of a package.json file.
#
f=$1
if [ -z "$f" ]; then
    f="package.json"
fi

cat $f| jq -r '(.dependencies | keys), (.devDependencies | keys) | .[]' | sort -u