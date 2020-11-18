# Variables
set -gx PATH $HOME/bin /usr/local/bin $HOME/.local/bin $HOME/.cargo/bin /snap/bin ~/.emacs.d/bin $PATH
set -gx EDITOR emacs
set -gx LFS /mnt/lfs
set -gx PROJECT_PATHS ~/projects
set -gx RUSTUP_HOME $HOME/.rustup
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

# abbreviations
abbr pacinstall "sudo pacman -S --needed"
abbr pacupdate "sudo pacman -Syu"

# install fisher if not installed
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# start ssh agent
fish_ssh_agent

# initialize starship prompt
starship init fish | source
