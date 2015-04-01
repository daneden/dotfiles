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

# Set to this to use case-sensitive completion
CASE_SENSITIVE="false"

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
plugins=(git ssh-agent command-not-found cp dirpersist autojump)

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
autoload -Uz gifme
autoload new-post
autoload git-open

if [ ! `hostname` = atlanta ]; then
  gifs_list=(`ls ~/Dropbox\ \(Personal\)/Photos/gifs`)
  compctl -k gifs_list gifme
fi

# Import private config
source $HOME/.zprivate

# Let 'er rip
source $ZSH/oh-my-zsh.sh

autoload -U promptinit && promptinit

# Eval rbenv for ruby goodness
eval "$(rbenv init -)"
