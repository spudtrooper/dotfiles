#!/bin/sh

dir=$(dirname "$0")

num=$1

if [ -z "$num" ]; then
    echo "Usage: $0 <number>"
    exit 1
fi

pushd $dir >/dev/null

cmds=$(seq 1 $num)

./tmux-split.sh $cmds

popd >/dev/null