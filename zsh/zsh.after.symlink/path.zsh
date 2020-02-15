if [ -d "/usr/local/rvm" ]; then
  [[ -s "/usr/local/rvm/scripts/rvm" ]] && source "/usr/local/rvm/scripts/rvm"
elif [ -d "$HOME/.rvm" ]; then
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
fi

if [ -d "$HOME/.npm-modules" ]; then
  export PATH="$HOME/.npm-modules/bin:$PATH"
fi

if [ -d "$HOME/.yarn" ]; then
  export PATH="$HOME/.yarn/bin:$PATH"
fi

export PATH=/usr/local/bin:$PATH
