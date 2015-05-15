#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/.dotfiles
############################

########## Variables

dir=~/.dotfiles                    # dotfiles directory
now=`date +%Y-%m-%d-%H:%M:%S`
olddir=~/.dotfiles_old/$now      # old dotfiles backup directory
files="gitconfig gitignore zshrc oh-my-zsh scss-lint.yml zfuncs vimrc vim zprivate"    # list of files/folders to symlink in homedir
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
printf "Moving any existing dotfiles from ~ to $olddir\n"
for file in $files; do
  mv ~/.$file $olddir
  printf "Creating symlink to $file in home directory.\n"
  ln -s $dir/$file ~/.$file
done

printf "\nMoving no-dot files from ~ to $olddir\n"
for file in $nodot; do
	mv ~/$file $olddir
	printf "Creating symlink to $file in home directory\n\n"
	ln -s $dir/$file ~/$file
	chflags -h hidden ~/$file
done

if [ "$(uname)" == "Darwin" ]; then
  echo "Installing pip and Codemod.\n"
  echo "We're going to need your password.\n"
  sudo easy_install pip
  sudo pip install git+https://github.com/facebook/codemod.git
fi

# Check presence of Homebrew, add bundler, then install our desired recipes & update them
type brew &>/dev/null && printf "`brew tap Homebrew/bundle && brew bundle &&
  brew update`" || echo "`ruby -e \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\" && brew tap Homebrew/bundle && brew bundle && brew update`"

# Install Vim plugins
vim +PluginInstall +qall

printf "\nAll done!\nYou may want to run 'brew upgrade', too.\n"
