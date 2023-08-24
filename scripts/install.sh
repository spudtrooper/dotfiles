#!/bin/sh

for f in files/*; do
  dest="$HOME/.$(basename "$f")"
  cp $f $dest
done

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

echo "Remember to run the following command:"
echo
echo "source $(rcfile)"
echo