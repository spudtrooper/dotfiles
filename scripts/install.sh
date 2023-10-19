#!/bin/sh

function copy_files() {
  for f in src/*; do
    if [[ -d $f ]]; then
      continue
    fi
    dest="$HOME/.$(basename "$f")"
    cp $f $dest
  done
}

function copy_bash_functions() {
  # Create directory ~/.bash_functions.d if it doesn't exist
  if [[ ! -d "$HOME/.bash_functions.d" ]]; then
    mkdir "$HOME/.bash_functions.d"
  fi
  # Copy the files in src/bash_functions.d to ~/.bash_functions.d
  for f in src/bash_functions.d/*; do
    if [[ -d $f ]]; then
      continue
    fi
    dest="$HOME/.bash_functions.d/$(basename "$f")"
    cp $f $dest
    chmod +x $dest
  done
}

# Outputs the most likely file that is your main bash RC file.
function rcfile() {
  if [[ -f "$HOME/.zprofile" ]]; then
    echo "$HOME/.zprofile"
  elif [[ "$SHELL" == *"/zsh"* ]]; then
    echo "$HOME/.zshrc"
  else
    echo "$HOME/.bashrc"
  fi
}

function main() {
  copy_files
  copy_bash_functions

  echo "Remember to run the following command for changes to take effect:"
  echo
  echo "source $(rcfile)"
  echo
}

main