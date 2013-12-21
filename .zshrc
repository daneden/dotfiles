# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="af-magic"

# Agnoster's theme has been through a fair bit of set up, but ran into some
# problems with Powerline. Commented out related code.
# ZSH_THEME="agnoster"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias update="sudo apt-get update && sudo apt-get upgrade"
alias atlanta="ssh ghost@direct.daneden.me -p 1991"
alias git=hub

# Fixing autocorrect where appropriate
alias grunt="nocorrect grunt"

function gifme() {
  if [[ -z $1 ]]; then
    echo "Usage: gifme name.gif [--open]";
  else
    echo "https://dl.dropboxusercontent.com/u/40044953/gifs/$1" | tr -d '\n' | pbcopy;
    echo "Copied link to $1";
  fi

  if [[ -n $2 ]]; then
    open https://dl.dropboxusercontent.com/u/40044953/gifs/$1;
  fi
}

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git ruby ssh-agent)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/local/rvm/gems/ruby-1.9.3-p327/bin:/usr/local/rvm/gems/ruby-1.9.3-p327@global/bin:/usr/local/rvm/rubies/ruby-1.9.3-p327/bin:/usr/local/rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

. ~/.shells/pure.zsh

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:~/bin:/usr/local/share/npm/bin

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Add NPM path
export NODE_PATH="/usr/local/lib/node"

autoload -U promptinit && promptinit
