#!/bin/sh

format() {
  if [ -z "$1" ]; then
    echo "Usage: format <file>"
    return 1
  fi

  if [ ! -f "$1" ]; then
    echo "File not found: $1"
    return 1
  fi

  cat "$1" | jq . 1>/dev/null || {
    echo "Invalid JSON: $1"
    return 1
  }
  cat "$1" | jq . >"$1".tmp.json
  if [[ -s "$1".tmp.json ]]; then
    mv "$1".tmp.json "$1"
    echo "Formatted: $1"
  else
    echo "Skiopping $1 because the output was empty"
  fi
}

export -f format

formatjsons() {
  if [ -z "$1" ]; then
    echo "Usage: format_all <file1> [<file2> ...]"
    return 1
  fi
  for file in "$@"; do
    if [ ! -f "$file" ]; then
      echo "File not found: $file"
      return 1e
    fi
  done
  printf "%s\n" "$@" | xargs -I {} -P 10 -n 1 sh -c 'format "$@"' _ {}
}

formatjsons "$@"
