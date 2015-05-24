#==============================
#
# Initialise Prezto
#
#==============================

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

#==============================
#
# General
#
#==============================

### Set character encoding
export LC_CTYPE=en_US.UTF-8

# Remove name@host from zsh theme
# (Except in ssh, which is actually pretty handy)
DEFAULT_USER=`whoami`


#==============================
#
# Aliases and extra things
#
#==============================

# Update dotfiles
alias updot="git --git-dir=$HOME/.dotfiles/.git pull --recurse-submodules && ~/.dotfiles/make.sh"

# Fixing autocorrect where appropriate
alias grunt="nocorrect grunt"

# Make editing config files easier/less meta
alias vimrc="vim $HOME/.vimrc"
alias zshrc="vim $HOME/.zshrc"
alias dotfiles="cd $HOME/.dotfiles"
alias reload="source $HOME/.zshrc"
alias sketchplugs="cd $HOME/Library/Containers/com.bohemiancoding.sketch3/Data/Library/Application\ Support/com.bohemiancoding.sketch3/Plugins"

# Jekyll helper aliases
alias jb="bundle exec jekyll build --config _config.yml,_config_local.yml"
alias js="bundle exec jekyll serve --watch --config _config.yml,_config_local.yml"

# `bundle exec` can be a bit long.
alias be="bundle exec"

# Easily jump to the root of a git repo
alias groot='cd "$(git rev-parse --show-toplevel)"'

# Add private aliases and functions
source $HOME/.zprivate

