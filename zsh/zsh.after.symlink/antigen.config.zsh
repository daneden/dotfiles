source ${HOME}/.dotfiles/antigen.zsh

# This initial apply is here to circumvent a caching bug
antigen apply

# Install plugins
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search

# Chocks away
antigen apply
