# Variables
set -gx PATH $HOME/.nodenv/bin $HOME/.rbenv/bin $HOME/bin /usr/local/bin $HOME/.local/bin $HOME/.cargo/bin /snap/bin $PATH
set -gx EDITOR nvim
set -gx LFS /mnt/lfs
set -gx PROJECT_PATHS ~/projects
set SPACEFISH_PROMPT_ORDER user dir host git package node docker ruby golang php rust haskell julia aws conda pyenv kubecontext exec_time time line_sep battery jobs exit_code char
set SPACEFISH_TIME_SHOW true
set SPACEFISH_DATE_SHOW true
set theme_color_scheme dracula

# aliases
alias dotdrop="/home/luqman/dotfiles/dotdrop.sh --cfg=/home/luqman/dotfiles/config.yaml"

alias config="/usr/bin/git --git-dir=$HOME/dotfiles.git/ --work-tree=$HOME"

alias ls="/usr/bin/exa"
