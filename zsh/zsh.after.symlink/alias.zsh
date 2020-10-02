# A handy utility for making and then cd-ing to a directory
function __mkc {
  if [ "$1x" != "x" ]; then
    mkdir "$1"
    cd "$1"
  fi
}

alias mkc="__mkc"

# Custom URL shortener
# (Requires that I've git cloned the shortener repo locally)
function __shorten {
  pushd ~/Repos/shortener;
  yarn shorten "$@";
  popd;
}

alias shorten='__shorten'

# A utility function to clone a GitHub repo and cd into it
function __gcd {
  if [ "$1x" != "x" ]; then
    git clone "https://github.com/$1"
    DIRNAME="$(cut -d'/' -f2 <<<$1)"
    cd "$DIRNAME"
  fi
}

alias gcd='__gcd'

# Some convenience aliases
alias pull="git pull"
alias push="git push"

# One-liner to fix Homebrew permissions
alias fixbrew="sudo chown -R $(whoami) /usr/local/bin /usr/local/lib /usr/local/sbin && chmod u+w /usr/local/bin /usr/local/lib /usr/local/sbin"
