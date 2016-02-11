#!/bin/sh

# Install prezto for zsh conveniences/wonderful things
echo 'installing prezto'
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
