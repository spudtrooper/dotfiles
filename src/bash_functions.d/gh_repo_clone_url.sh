#!/bin/sh

# https://github.com/egoroof/browser-id3-writer
# github.com/egoroof/browser-id3-writer
url=$1

repo=$(echo $url | sed -e 's/.*github.com\///' -e 's/\.git$//')

githubdir=$(readlink -f $HOME/Projects/github)
repodir="$githubdir/$(basename $repo)"

echo
echo "Cloning $repo to:"
echo
echo "   $repodir"
echo

pushd $githubdir >/dev/null
gh repo clone $repo
popd >/dev/null

echo "$repodir"
