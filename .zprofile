export CLICOLOR=1

. "$HOME/.bash_aliases"
. "$HOME/.bash_prompt"

export LSCOLORS=exfxcxdxbxegedabagacad

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

eval "$(/opt/homebrew/bin/brew shellenv)"