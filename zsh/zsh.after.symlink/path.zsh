if [ -d "/usr/local/rvm" ]; then
  [[ -s "/usr/local/rvm/scripts/rvm" ]] && source "/usr/local/rvm/scripts/rvm"
elif [ -d "$HOME/.rvm" ]; then
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
fi
