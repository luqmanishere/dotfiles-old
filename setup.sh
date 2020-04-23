#!/bin/sh

alias config="git --git-dir='$HOME/dotfiles.git' --work-tree=$HOME"

curl -sLf https://spacevim.org/install.sh | bash

config config --local status.showUntrackedFiles no
