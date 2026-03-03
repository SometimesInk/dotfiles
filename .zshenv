# XDG
export XDG_CONFIG_HOME="$HOME/.config"

# Editors
export EDITOR="nvim"
export VISUAL="nvim"

# Zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$ZDOTDIR/.zhistory"
export HISTSIZE=5000
export HISTDUP=erase
export SAVESIZE=$HISTSIZE

# Add cargo to path
export PATH="$PATH:/home/ink/.cargo/bin"
