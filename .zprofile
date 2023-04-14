export CLICOLOR=1

. "$HOME/.bash_aliases"
. "$HOME/.bash_prompt"
. "$HOME/.bash_functions"

export LSCOLORS=exfxcxdxbxegedabagacad

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# pip is screwed up?
export PYTHONPATH=/opt/homebrew/lib/python3.9/site-packages

export PATH="$PATH:$(go env GOPATH)/bin"
export GOPHERJS_GOROOT="$(go env GOROOT)"
export SUBLIST3R_PY=/Users/jeff/Projects/Sublist3r/sublist3r.py

eval "$(/opt/homebrew/bin/brew shellenv)"

HISTFILESIZE=10000000
HISTSIZE=10000000