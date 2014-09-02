#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/.dotfiles
############################

########## Variables

dir=~/.dotfiles                    # dotfiles directory
now=`date +%Y-%m-%d-%H:%M:%S`
olddir=~/.dotfiles_old/$now      # old dotfiles backup directory
files="gitconfig gitignore zshrc oh-my-zsh scss-lint.yml"    # list of files/folders to symlink in homedir
nodot="Brewfile" # list of non-dot files to symlink

##########

# create dotfiles_old in homedir
printf "Creating $olddir for backup of any existing dotfiles in ~\n"
mkdir -p $olddir
printf "...done\n\n"

# change to the dotfiles directory
printf "Changing to the $dir directory\n"
cd $dir
printf "...done\n\n"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
  printf "Moving any existing dotfiles from ~ to $olddir\n"
  mv ~/.$file $olddir
  printf "Creating symlink to $file in home directory.\n\n"
  ln -s $dir/$file ~/.$file
done

for file in $nodot; do
	printf "Moving no-dot files from ~ to $olddir\n"
	mv ~/$file $olddir
	printf "Creating symlink to $file in home directory\n\n"
	ln -s $dir/$file ~/$file
	chflags -h hidden ~/$file
done

printf "You’re all set, kid. Happy zshing. \n"
