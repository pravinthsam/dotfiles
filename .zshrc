#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
# added by Anaconda3 4.4.0 installer
export PATH="/home/pravinth/anaconda3/bin:$PATH"
export PATH="/usr/local/cuda/bin:$PATH"
export PATH="/usr/lib:$PATH"

export MANPATH=/usr/local/cuda/man:${MANPATH}
# add cuda libraries to library path
if [[ "${LD_LIBRARY_PATH}" != "" ]]
then
  export LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH}
else
  export LD_LIBRARY_PATH=/usr/local/cuda/lib64
fi

export LD_LIBRARY_PATH="/home/pravinth/cudnn:$LD_LIBRARY_PATH"

alias sdocker="sudo docker"
BASE16_SHELL=$HOME/.config/base16-shell/ 
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

alias python-vim='sudo docker run -it --rm -v $(pwd):/src fedeg/python-vim:3'
