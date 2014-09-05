# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

###########
# ALIASES #
###########

# This guy is specific to *nix/apt-get boxes
if [ `hostname` = atlanta ]; then
	alias update="sudo apt-get update && sudo apt-get upgrade"
fi

# Update dotfiles
alias updot="git --git-dir=$HOME/.dotfiles/.git pull --recurse-submodules && ~/.dotfiles/make.sh"

# This guy is to help me quickly jump into my server
alias atlanta="ssh ghost@direct.daneden.me -p 1991"

# And this guy is to make use of hub, assuming it's installed
alias git=hub

# Fixing autocorrect where appropriate
alias grunt="nocorrect grunt"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
#DISABLE_AUTO_UPDATE="true"

# Display red dots while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Remove name@host from zsh theme
# (Except in ssh, which is actually pretty handy)
DEFAULT_USER=`whoami`

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git ssh-agent command-not-found cp dirpersist)

# Customize to your needs...
# Make sure Homebrew’s path appears first
export PATH=/usr/local/bin:$PATH

# NPM path
export PATH=$PATH:~/bin:/usr/local/share/npm/bin

# Arcanist path
export PATH=$HOME/.arc_install/arcanist/bin:$PATH

# Change the default editor
export EDITOR='subl'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Add NPM path
export NODE_PATH="/usr/local/lib/node"

### Set character encoding
export LC_CTYPE=en_US.UTF-8

# Let 'er rip
source $ZSH/oh-my-zsh.sh

# Add arc tab completion
source /usr/local/arcanist/resources/shell/bash-completion

autoload -U promptinit && promptinit


export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
