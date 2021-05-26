# Variables
set -gx PATH $HOME/bin /usr/local/bin $HOME/.local/bin $HOME/.cargo/bin /snap/bin ~/.emacs.d/bin $PATH
set -gx EDITOR emacs
set -gx LFS /mnt/lfs
set -gx PROJECT_PATHS ~/projects
set -gx RUSTUP_HOME $HOME/.rustup

set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_CACHE_HOME "$HOME/.cache"
set -gx XDG_DATA_HOME "$HOME/.local/share"

set -xU LESS_TERMCAP_md (printf "\e[01;31m")
set -xU LESS_TERMCAP_me (printf "\e[0m")
set -xU LESS_TERMCAP_se (printf "\e[0m")
set -xU LESS_TERMCAP_so (printf "\e[01;44;33m")
set -xU LESS_TERMCAP_ue (printf "\e[0m")
set -xU LESS_TERMCAP_us (printf "\e[01;32m")

set SPACEFISH_PROMPT_ORDER user dir host git package node docker ruby golang php rust haskell julia aws conda pyenv kubecontext exec_time time line_sep battery jobs exit_code char
set SPACEFISH_TIME_SHOW true
set SPACEFISH_DATE_SHOW true
set theme_color_scheme dracula

# aliases
alias dotdrop="/home/luqman/dotfiles/dotdrop.sh --cfg=/home/luqman/dotfiles/config.yaml"
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias ls (which exa)
alias dots $HOME/.dotbare/dotbare
alias mux tmuxinator
alias ip "ip -c=auto"

# abbreviations
source $__fish_config_dir/conf.d/abbr.fish

if not functions -q fundle
    eval (curl -sfL https://git.io/fundle-install)
end

fundle plugin edc/bass
fundle plugin franciscolourenco/done
fundle plugin jethrokuan/fzf
fundle plugin laughedelic/pisces
fundle plugin oh-my-fish/plugin-bang-bang
fundle plugin gazorby/fish-abbreviation-tips
fundle plugin oh-my-fish/plugin-foreign-env

fundle init

eval (keychain --eval --agents ssh -Q --quiet git general gitmain --nogui)

# Initialize zoxide
zoxide init fish | source

# Initialize navi
navi widget fish | source

# initialize starship prompt
starship init fish | source
