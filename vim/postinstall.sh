#!/bin/zsh

function clone_pull {
  DIRECTORY="$HOME/.vim/pack/$1/start/$1"
  if [ -d "$DIRECTORY" ]; then
    echo "${WAITING}Updating $1..."
    cd "$DIRECTORY"
    git pull --ff-only
    cd
    echo "${DONE}Updated $1\n"
  else
    echo "${WAITING}Installing $1..."
    git clone "https://github.com/$2" $DIRECTORY
    echo "${DONE}Installed $1\n"
  fi
}

clone_pull typescript-vim "leafgarland/typescript-vim.git"
clone_pull vim-javascript "pangloss/vim-javascript.git"
