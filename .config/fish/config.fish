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
alias ip "ip -c=auto"

# abbreviations
source $__fish_config_dir/conf.d/abbr.fish

# install fisher if not installed
#if not functions -q fisher
#    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
#    cd ~/.config/fish/functions && wget git.io/fisher
#    mv fisher fisher.fish
#    source fisher.fish && fisher update
#    cd
#    fish
#end

# Fisher is being an ass, so i'll use fundle for now
if not functions -q fundle
    eval (curl -sfL https://git.io/fundle-install)
end

fundle plugin 'edc/bass'
fundle plugin 'franciscolourenco/done'
fundle plugin 'jethrokuan/fzf'
fundle plugin 'jethrokuan/z'
fundle plugin 'laughedelic/pisces'
fundle plugin 'oh-my-fish/plugin-bang-bang'
fundle plugin 'gazorby/fish-abbreviation-tips'
fundle plugin 'oh-my-fish/plugin-foreign-env'

fundle init

# start ssh agent
#fish_ssh_agent
#echo "SSH_AUTH_SOCK=$SSH_AUTH_SOCK" >/home/luqman/.ssh/env-sock
#echo "SSH_AGENT_PID=$SSH_AGENT_PID" >/home/luqman/.ssh/env-pid
eval (keychain --eval --agents ssh -Q --quiet git --nogui)

# initialize starship prompt
starship init fish | source
