#!/usr/bin/env bash
#
# Check if brew is installed, then run bundle to get latest packages listed in Brewfile

cd "$(dirname $0)"/..

if hash brew 2>/dev/null; then
  brew tap Homebrew/bundle
  brew bundle check || brew bundle install
fi
