#!/bin/zsh

#==============================
#
# Dotfiles: The Dan Eden Story
# ----------------------------
#
# This makefile moves old dotfiles, creates symlinks to new ones, installs
# useful stuff and basically automates a lot of tiresome configuration.
#
#==============================

# First, let's set up some ouput functions
red=$'\e[1;31m'
pur=$'\e[0;35m'
yel=$'\e[0;33m'
grn=$'\e[0;32m'
end=$'\e[0m'

msg() {
  printf "${yel} ~ ${pur}$*${end}\n"
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


#==============================
#
# Variables
#
#==============================

dir=$HOME/.dotfiles                    # dotfiles directory
now=`date +%Y-%m-%d-%H:%M:%S`
olddir=$HOME/.dotfiles_old/$now      # old dotfiles backup directory
files=("gitconfig" "gitignore_global" "vimrc" "vim" "zprivate")    # list of files/folders to symlink in homedir
nodot=("Brewfile") # list of non-dot files to symlink


#==============================
#
# Introduction
#
#==============================

printf "\n\n${yel} _____     ______     ______   ______   __     __         ______     ______
/\\  __-.  /\\  __ \\   /\\__  _\\ /\\  ___\\ /\\ \\   /\\ \\       /\\  ___\\   /\\  ___\\
\\ \\ \\/\\ \\ \\ \\ \\/\\ \\  \\/_/\\ \\/ \\ \\  __\\ \\ \\ \\  \\ \\ \\____  \\ \\  __\\   \\ \\___  \\
 \\ \\____-  \\ \\_____\\    \\ \\_\\  \\ \\_\\    \\ \\_\\  \\ \\_____\\  \\ \\_____\\  \\/\\_____\\
  \\/____/   \\/_____/     \\/_/   \\/_/     \\/_/   \\/_____/   \\/_____/   \\/_____/${end}

                             ${red}THE DAN EDEN STORY${end}\n\n\n"

printf "This script is gonna do a bunch of wacky things to your computer/CLI. Continue? [Y/n] "
read a
if [[ $a == "N" || $a == "n" ]]; then
  printf "\n${red}FORMATTING DISK...${end}\n"
  sleep 1
  printf "${pur}Just kidding. Didn't touch a thing.${end}\n\n"
  exit;
else
  printf "\n${grn}You're the boss. Here we go.${end}\n\n"
  sleep 1
fi

#==============================
#
# Housekeeping
#
#==============================

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

# Set up global gitignore
git config --global core.excludesfile ~/.gitignore_global

don


#==============================
#
# Prezto
#
#==============================

# Install Prezto
if [ ! -d "$HOME/.zprezto" ]; then
  msg "Installing Prezto..."
  git clone --recursive https://github.com/daneden/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
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

cd $dir && ln -sf $dir/zpreztorc $HOME/.zpreztorc && ln -sf $dir/zshrc $HOME/.zshrc
don

# Install 256-color Base16 shell
if [ ! -d "$HOME/.config/base16-shell" ]; then
  msg "Installing base16-shell..."
  git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
  don
fi


#==============================
#
# Package manager stuff
#
#==============================

# Install pip and Codemod
msg "Installing pip, Neovim, and Codemod..."
printf "Admin password may be required.\n"

if [[ `uname` == "Darwin" ]]; then
  sudo easy_install pip
elif [[ `uname` == "Linux" ]]; then
  sudo apt-get install pip
  sudo add-apt-repository ppa:neovim-ppa/unstable && sudo apt-get install neovim
fi

sudo -H pip install git+https://github.com/facebook/codemod.git --upgrade
sudo pip install neovim
don

# Check presence of Homebrew, add bundler, then install our desired recipes & update them
if [[ `uname` == "Darwin" ]]; then
  msg "Installing Homebrew packages..."
  type brew &>/dev/null && printf "`brew bundle`" || echo "`ruby -e \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\" && brew tap Homebrew/bundle && brew bundle`"
  brew update && brew upgrade `brew outdated`
  don
fi

# Install node & npm packages
msg "Installing Node.js and npm packages..."
if hash node 2>/dev/null; then
  if [[ `uname` == "Darwin" ]]; then
    brew install node
  elif [[ `uname` == "Linux" ]]; then
    sudo apt-add-repository -y ppa:chris-lea/node.js && sudo apt-get update && sudo apt-get install -y nodejs
  fi
fi
npm install -g
don

#==============================
#
# Vim
#
#==============================

# Install Vim plugins
msg "Installing setting up vim/neovim..."
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
ln -s ~/.vim $XDG_CONFIG_HOME/nvim
ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugClean! +PlugInstall! +qall
don


#==============================
#
# Misc. Goodies
#
#==============================

if [[ `uname` == "Darwin" ]]; then
  msg "Adding Mac goodies..."
  if [ ! -d "$HOME/.bin" ]; then
    mkdir $HOME/.bin
  fi
  ln -sf /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport $HOME/.bin/airport
  don
fi


#==============================
#
# Closing ceremonies
#
#==============================

# Switch to zsh if we're not already there
if [[ ! `echo $SHELL` == "/bin/zsh" ]]; then
  msg "Switching to zsh..."
  chsh -s /bin/zsh
  don
fi

source $HOME/.zshrc

suc "All done!"
suc "Don't forget to tip your barista.\n"
