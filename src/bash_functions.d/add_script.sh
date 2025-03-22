#!/bin/sh
#
# Usage:
#
# # Adds script "foo" to package.json that runs "echo foo"
# % add_script --name foo --command "echo foo"
#
  # Same
# % echo foo 
# % add_script foo --last
#

set -e

usage() {
  echo "Usage: $0 --name <script_name> --command <command>"
  echo "       $0 <script_name> --last"
  exit 1
}

if [ "$#" -eq 0 ]; then
  usage
fi

NAME=""
COMMAND=""
LAST=true

if [ "$#" -eq 1 ]; then
  NAME="$1"
  LAST=true
else
  while [ "$#" -gt 0 ]; do
    case "$1" in
      --name)
        NAME="$2"
        LAST=false
        shift 2
        ;;
      --command)
        COMMAND="$2"
        LAST=false
        shift 2
        ;;
      --last)
        LAST=true
        NAME="$1"
        shift
        ;;
      *)
        if [ -z "$NAME" ]; then
          NAME="$1"
        else
          usage
        fi
        shift
        ;;
    esac
  done
fi

if [ -z "$NAME" ]; then
  echo "Error: script name is required"
  usage
fi

if [ "$LAST" = false ] && [ -z "$COMMAND" ]; then
  echo "Error: command is required"
  usage
fi

if [ "$LAST" = true ]; then
  COMMAND=$(tail -n 1 package.json | sed -e 's/.*"scripts": {.*"\([^"]*\)": "\(.*\)".*/\2/')
fi

jq ".scripts[\"$NAME\"] = \"$COMMAND\"" package.json > tmp.$$.json && mv tmp.$$.json package.json

echo "Added script \"$NAME\" with command \"$COMMAND\" to package.json"