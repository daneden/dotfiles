ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"

autoload -U promptinit compinit
promptinit
compinit

####################
# OH-MY-ZSH CONFIG #
####################

# Set to this to use case-sensitive completion
CASE_SENSITIVE="false"

# Display red dots while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Remove name@host from zsh theme
# (Except in ssh, which is actually pretty handy)
DEFAULT_USER=`whoami`

# Load plugins
plugins=(git gitfast git-extras ssh-agent command-not-found cp dirpersist autojump)

# Customize to your needs...
# Make sure Homebrew’s path appears first
export PATH=/usr/local/bin:$PATH

# NPM path
export PATH=$PATH:$HOME/bin:/usr/local/share/npm/bin

# Arcanist path
export PATH=$PATH:$HOME/.arc_install/arcanist/bin

### Added by the Heroku Toolbelt
export PATH="$PATH:/usr/local/heroku/bin"

### Add NPM path
export NODE_PATH="/usr/local/lib/node"

### Set character encoding
export LC_CTYPE=en_US.UTF-8

### Load custom functions
export FPATH=~/.zfuncs:$FPATH

### Set Vim as the default editor
export EDITOR="/usr/bin/vim"

### Set new path for Homebrew Cask
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Add rbenv to PATH
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

lt_shell_functions_dir=~/.zfuncs

if [[ -d $lt_shell_functions_dir ]]; then
    fpath=($lt_shell_functions_dir $fpath)
    for function_file in $lt_shell_functions_dir/*
    do
        autoload -Uz ${function_file##*/} || printf "Autoloading $function_file failed\n"
    done
#    unset function_file
else
    printf "no $lt_shell_functions_dir exists.\n"
fi

if [ ! `hostname` = atlanta ]; then
  gifs_list=(`ls ~/Dropbox\ \(Personal\)/Photos/gifs`)
  compctl -k gifs_list gifme
fi

# Import private config
source $HOME/.zprivate

# Let 'er rip
source $ZSH/oh-my-zsh.sh

###########
# ALIASES #
###########

# Update dotfiles
alias updot="git --git-dir=$HOME/.dotfiles/.git pull --recurse-submodules && ~/.dotfiles/make.sh"

# And this guy is to make use of hub, assuming it's installed
alias git=hub

# Fixing autocorrect where appropriate
alias grunt="nocorrect grunt"

# Make editing config files easier/less meta
alias vimrc="vim $HOME/.vimrc"
alias zshrc="vim $HOME/.zshrc"
alias dotfiles="cd $HOME/.dotfiles"
alias src="source $HOME/.zshrc"
alias sketchplugs="cd $HOME/Library/Containers/com.bohemiancoding.sketch3/Data/Library/Application\ Support/com.bohemiancoding.sketch3/Plugins"

# Jekyll helper aliases
alias jb="bundle exec jekyll build --config _config.yml,_config_local.yml"
alias js="bundle exec jekyll serve --watch --config _config.yml,_config_local.yml"

# `bundle exec` can be a bit long.
alias be="bundle exec"

# Easily jump to the root of a git repo
alias groot='cd "$(git rev-parse --show-toplevel)"'
