source ${HOME}/.dotfiles/antigen.zsh

# This initial apply is here to circumvent a caching bug
antigen apply

# Install plugins
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search

# Chocks away
antigen apply

# Apply config specific to these packages

## History Substring Search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
