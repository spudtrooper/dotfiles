export CLICOLOR=1

. "$HOME/.bash_aliases"
. "$HOME/.bash_prompt"

# The next line updates PATH for the Google Cloud SDK.
#if [ -f '/Users/jeff/ThirdParty/google-cloud-sdk/path.bash.inc' ]; then source '/Users/jeff/ThirdParty/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
#if [ -f '/Users/jeff/ThirdParty/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/jeff/ThirdParty/google-cloud-sdk/completion.bash.inc'; fi

export PATH=$PATH:/usr/local/opt/go/libexec/bin

##
# Your previous /Users/jeff/.bash_profile file was backed up as /Users/jeff/.bash_profile.macports-saved_2018-08-08_at_23:02:13
##

# MacPorts Installer addition on 2018-08-08_at_23:02:13: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


export PATH=$HOME/.cargo/bin:$PATH

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Setting PATH for Python 3.8
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.8/bin:${PATH}"
export PATH
