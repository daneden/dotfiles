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
alias update="sudo apt-get update && sudo apt-get upgrade"
# This guy is to help me quickly jump into my server
alias atlanta="ssh ghost@direct.daneden.me -p 1991"
# And this guy is to make use of hub, assuming it's installed
alias git=hub

# Fixing autocorrect where appropriate
alias grunt="nocorrect grunt"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Display red dots while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git ruby ssh-agent)

# Let 'er rip
source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/local/rvm/gems/ruby-1.9.3-p327/bin:/usr/local/rvm/gems/ruby-1.9.3-p327@global/bin:/usr/local/rvm/rubies/ruby-1.9.3-p327/bin:/usr/local/rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:~/bin:/usr/local/share/npm/bin
export PATH=$HOME/.arc_install/arcanist/bin:$PATH

# Set local development variable for Jekyll
export JEKYLL_ENV=development

### Change the default editor to Atom
export EDITOR='subl'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Add NPM path
export NODE_PATH="/usr/local/lib/node"

### Set character encoding
export LC_CTYPE=en_US.UTF-8

autoload -U promptinit && promptinit
