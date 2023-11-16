#!/bin/sh

repo=$1
if [[ -z "$repo" ]]; then
  echo "Usage: $0 <repo>"
  exit 1
fi

if [[ $repo == *"github.com"* && $repo == *".git" ]]; then
  package_url=$(echo $repo | sed 's#github.com#raw.githubusercontent.com#' | sed 's#\.git$#/main/package.json#')
  version=$(curl "$package_url" 2> /dev/null | jq -r ".version")
  echo $version
  exit 0
else
  echo "cannot handle repo: $repo"
  exit 1
fi
