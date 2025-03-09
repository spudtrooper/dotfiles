#!/bin/sh

tmp=$(mktemp)
grep 'function \w\+' $1 | awk '{print $2}' > $tmp
grep  'const \w\+\s*= .*(' $1 | awk '{print $2}' > $tmp

cat $tmp | sort | uniq