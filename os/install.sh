if [ "$(uname)" == "Darwin" ]; then
  defaults write NSGlobalDomain KeyRepeat -int 1
fi
