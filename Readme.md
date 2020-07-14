# Dotfiles: The Dan Eden Story

I have no idea what I’m doing, but with any luck, that’ll change the more I use
my own dotfiles.

## Installation

1. In your home folder (just type `cd` in terminal to get there, silly), run
   `git clone https://github.com/daneden/dotfiles .dotfiles`
2. Navigate to the cloned directory and run `./setup.sh`
3. Party.

## What's Inside?

1. A script that copies dotfiles to my home directory to configure things like
   git, vim, and zsh
   - This works by looking for files with a `.symlink` suffix
2. zsh configuration that provides a useful prompt and some aliases
   - The `prompt.zsh` file contains a lot of code copied from The Internet to
     get my git status to show in the prompt
3. git configuration that provides my own details and some aliases
4. vim configuration that provides some plugins and sets some preferences
   - To avoid bloating my dotfiles with overrides from e.g. oh-my-zsh, I've
     opted to write all my dotfiles using only built-in package managers and
     options. Vim is chief amongst examples of this, since my `.vimrc` is pretty
     long.
5. A Brewfile to install common apps and CLI tools I use frequently
6. Yarn/Node global package installation
