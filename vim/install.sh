#!/usr/bin/env bash

echo 'installing (n)vim plugins'
vim +PlugClean! +PlugInstall! +qall
