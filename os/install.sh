if [ "$(uname)" == "Darwin" ]; then
  defaults write NSGlobalDomain KeyRepeat -int 0
fi
