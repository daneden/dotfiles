#!/bin/zsh
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/.dotfiles
############################

########## Variables

dir=$HOME/.dotfiles                    # dotfiles directory
now=`date +%Y-%m-%d-%H:%M:%S`
olddir=$HOME/.dotfiles_old/$now      # old dotfiles backup directory
files="gitconfig gitignore zfuncs vimrc vim zprivate"    # list of files/folders to symlink in homedir
nodot="Brewfile" # list of non-dot files to symlink

#------------------------------
#
# Housekeeping
#
#------------------------------

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
  mv $HOME/.$file $olddir
  printf "Creating symlink to $file in home directory.\n"
  ln -s $dir/$file $HOME/.$file
done

printf "\nMoving no-dot files from ~ to $olddir\n"
for file in $nodot; do
	mv $HOME/$file $olddir
	printf "Creating symlink to $file in home directory\n\n"
	ln -s $dir/$file $HOME/$file
	chflags -h hidden $HOME/$file
done

if [ ! -d "$HOME/.zprezto" ]; then
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

  setopt EXTENDED_GLOB
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done
else
  cd $HOME/.zprezto && git pull && git submodule update --init --recursive
fi

cd $dir && ln -sf $dir/zpreztorc $HOME/.zpreztorc

#------------------------------
#
# Package manager stuff
#
#------------------------------

# Install pip and Codemod
echo "Installing pip and Codemod."
echo "We're going to need your password."

if [[ `uname` == "Darwin" ]]; then
  sudo easy_install pip
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  sudo apt-get install pip
fi

sudo -H pip install git+https://github.com/facebook/codemod.git


# Check presence of Homebrew, add bundler, then install our desired recipes & update them
type brew &>/dev/null && printf "`brew tap Homebrew/bundle && brew bundle &&
  brew update`" || echo "`ruby -e \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\" && brew tap Homebrew/bundle && brew bundle && brew update`"


# Install Vim plugins
vim +PluginInstall +qall

printf "\nAll done!\nYou may want to run 'brew upgrade', too.\n"
