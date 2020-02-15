#!/bin/sh

if hash rvm 2>/dev/null; then
  rvm get stable --auto-dotfiles
else
  echo "rvm not found, skipping Ruby post-install"
fi
