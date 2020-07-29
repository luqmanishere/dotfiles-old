#!/bin/sh

alias config="git --git-dir='$HOME/.cfg' --work-tree=$HOME"

curl -sLf https://spacevim.org/install.sh | bash

config config --local status.showUntrackedFiles no

config submodule update --init --recursive

ln -s -f .tmux/.tmux.conf ~/.tmux.conf
