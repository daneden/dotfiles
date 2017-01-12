# A handy utility for making and then cd-ing to a directory
function __mkc {
  if [ "$1x" != "x" ]; then
    mkdir "$1"
    cd "$1"
  fi
}

alias mkc="__mkc"

# Attach to tmux with 24-bit color
alias tm="tmux -2 attach -d -t init || tmux -2 new -s init"
