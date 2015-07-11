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
export DEFAULT_USER=`whoami`

export EDITOR=/usr/local/bin/vim
export VISUAL=/usr/local/bin/vim

# Base16 Shell
export BASE16_SHELL="$HOME/.config/base16-shell/base16-google.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL


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

# Start screensaver
alias ss='open -a /System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app'

# Ag is in Brewfile and it's faster, but I keep forgetting
alias ack='ag'

#==============================
#
# Wrap it up
#
#==============================

# Add private aliases and functions
source $HOME/.zprivate

# Activate virtual environment if one exists
if [[ -s "$HOME/.virt_env/bin/activate" ]]; then
  source "$HOME/.virt_env/bin/activate"
fi

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
