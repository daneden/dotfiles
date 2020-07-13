#!/bin/bash

# Create necessary directories for Vim
dirs=( "$HOME/.vim.user/undo" )
i=0

for dir in "${dirs[@]}"
do
  if [ ! -d "$dir" ]; then
    mkdir -p $dir
    echo "Creating directory $dir"
    i=$((i+1))
  fi

done

if [ $i -eq 0 ]; then
  echo "No new directories created"
else
  echo "Created $i new directories"
fi

