#!/bin/zsh

# First, let's get some helpful colors.
red=$'\e[1;31m'
yel=$'\e[0;35m'
grn=$'\e[0;32m'
end=$'\e[0m'

msg() {
  printf "${yel}$*${end}\n"
}

suc() {
  printf "${grn}$*${end}\n"
}

warn() {
  printf "${red}$*${end}\n"
}

don() {
  printf "...done\n\n"
}

############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/.dotfiles
############################

########## Variables

dir=$HOME/.dotfiles                    # dotfiles directory
now=`date +%Y-%m-%d-%H:%M:%S`
olddir=$HOME/.dotfiles_old/$now      # old dotfiles backup directory
files=("gitconfig" "gitignore" "vimrc" "vim" "zprivate")    # list of files/folders to symlink in homedir
nodot=("Brewfile") # list of non-dot files to symlink

#------------------------------
#
# Housekeeping
#
#------------------------------

# create dotfiles_old in homedir
msg "Creating $olddir for backup of any existing dotfiles in $HOME..."
mkdir -p $olddir
don

# change to the dotfiles directory
cd $dir

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
msg "Moving existing dotfiles from $HOME to $olddir..."
for file in $files; do
  mv $HOME/.$file $olddir
  ln -s $dir/$file $HOME/.$file
done

for file in $nodot; do
	mv $HOME/$file $olddir
	ln -s $dir/$file $HOME/$file
	chflags -h hidden $HOME/$file
done
don

# Install Prezto
if [ ! -d "$HOME/.zprezto" ]; then
  msg "Installing Prezto..."
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
else
  msg "Updating Prezto..."
  cd $HOME/.zprezto && git pull && git submodule update --init --recursive
fi
don

# Create symlinks to Prezto dotfiles
msg "Symlinking Prezto dotfiles..."
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

cd $dir && ln -sf $dir/zpreztorc $HOME/.zpreztorc
don

#------------------------------
#
# Package manager stuff
#
#------------------------------

# Install pip and Codemod
msg "Installing pip and Codemod..."
printf "Admin password may be required.\n"

if [[ `uname` == "Darwin" ]]; then
  sudo easy_install pip
elif [[ `uname` == "Linux" ]]; then
  sudo apt-get install pip
fi

sudo -H pip install git+https://github.com/facebook/codemod.git --upgrade
don

# Check presence of Homebrew, add bundler, then install our desired recipes & update them
if [[ `uname` == "Darwin" ]]; then
  msg "Installing Homebrew packages..."
  type brew &>/dev/null && printf "`brew upgrade --all && brew bundle &&
    brew update`" || echo "`ruby -e \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\" && brew tap Homebrew/bundle && brew bundle && brew update`"
  don
fi

# Install Vim plugins
msg "Installing Vim plugins..."
vim +PluginClean! +PluginInstall! +qall
don

# Switch to zsh if we're not already there
if [[ ! `echo $SHELL` == "/bin/zsh" ]]; then
  msg "Switching to zsh..."
  chsh -s /bin/zsh
  don
fi

source $HOME/.zshrc

suc "All done!"
suc "Don't forget to tip your barista.\n"