#!/bin/sh

source .config/fish/config_fish
curl -sLf https://spacevim.org/install.sh | bash

config config --local status.showUntrackedFiles no
