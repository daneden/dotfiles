#!/bin/bash

# Create necessary directories for Vim
dirs=( "$HOME/.vim/undo" "$HOME/.cache/neocomplete" )
i=0

for dir in "${dirs[@]}"
do
  if [ ! -d "$dir" ]; then
    mkdir -p $dir
    echo "Creating directory $dir"
    i=i+1
  fi

done

if [ i == 0 ]; then
  echo "No new directories created"
else
  echo "Created $i new directories"
fi
