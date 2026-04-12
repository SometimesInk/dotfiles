# Initialize zinit plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# Add completion
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
autoload -U compinit && compinit

zinit cdreplay -q

# Keymappings for zsh-autosuggestions
bindkey '^f' autosuggest-accept
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Style autocomplete
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

# Theme

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Aliases
alias ls='ls --color'
alias lsa='ls -A --color'

eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"
eval "$(starship init zsh)"
