###### ZSHRC ######

autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES

source $HOME/.antigen/antigen.zsh

antigen use oh-my-zsh
antigen theme denysdovhan/spaceship-prompt
antigen bundle zdharma/fast-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions

antigen use prezto
antigen bundle sorin-ionescu/prezto modules/utility
antigen bundle sorin-ionescu/prezto modules/completion

antigen apply

SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  package       # Package version
  node          # Node.js section
  ruby          # Ruby section
  elixir        # Elixir section
  xcode         # Xcode section
  swift         # Swift section
  golang        # Go section
  php           # PHP section
  rust          # Rust section
  haskell       # Haskell Stack section
  julia         # Julia section
  docker        # Docker section
  venv          # virtualenv section
  conda         # conda virtualenv section
  pyenv         # Pyenv section
  ember         # Ember.js section
  exec_time     # Execution time
  exit_code     # Exit code section
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  char          # Prompt character
)

SPACESHIP_RPROMPT_ORDER=(
  battery       # Battery level and status
  time
  )

SPACESHIP_TIME_SHOW=true
SPACESHIP_BATTERY_SHOW=always
SPACESHIP_EXIT_CODE_SHOW=true

ZSH_AUTOSUGGEST_USE_ASYNC=true


autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search
