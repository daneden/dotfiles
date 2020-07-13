#!/bin/zsh
#
# Check if brew is installed, then run bundle to get latest packages listed in Brewfile

cd "$(dirname $0)"/..

# Install Homebrew if not present, otherwise update
if ! command -v brew &> /dev/null
then
	echo "${WAITING}Installing Homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
  echo "${DONE}Homebrew installed"
  echo "${WAITING}Updating Homebrew..."
  brew update && brew upgrade
  echo "${DONE}Finished updating Homebrew\n"

  echo "${WAITING}Installing/updating from Brewfile..."
  brew tap Homebrew/bundle
  brew bundle check || brew bundle install
  echo "${DONE}Finished with Brewfile\n"
fi

if hash brew 2>/dev/null; then
fi
