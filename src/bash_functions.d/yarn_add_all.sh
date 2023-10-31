#!/bin/bash

if ! command -v yarn &> /dev/null; then
  brew add yarn
fi

extract_modules_from_files() {
  for file in "$@"; do
    cat "$file" | grep -oE "from ['\"]([^'\"]+)['\"]" "$1" | awk '{print $2}' | tr -d "'\""
  done
}

modules_list="$(extract_modules_from_files "$@" | sort | uniq)"
if [ ! -z "$modules_list" ]; then
    yarn add $modules_list
else
    echo "No modules found to add."
fi
