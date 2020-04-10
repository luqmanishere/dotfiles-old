#!/bin/zsh

# Starts my programming tmux session 

if [ $# -eq 0 ]
  then
    echo "No arguments supplied, requires name of window."
    exit 1
fi

CWD=$(pwd)
SESSION_NAME="$1"
PROJECT_NAME="$2"
# detach from a tmux session if in one
tmux detach > /dev/null

# Create a new session, -d means detached itself
set -- $(stty size) # $1 = rows $2 = columns
tmux new-session -d -s $SESSION_NAME -x "$2" -y "$(($1 - 1))"

tmux new-window -t $SESSION_NAME:1 -n 'ranger'
tmux new-window -t $SESSION_NAME:2 -n 'nvim'
tmux new-window -t $SESSION_NAME:3 -n 'build'

## nvim window
tmux select-window -t $SESSION_NAME:2

# Change to project directory
tmux send-keys "cd ~/projects/$PROJECT_NAME" C-m

## Zsh window
tmux select-window -t $SESSION_NAME:3
tmux send-keys "cd ~/projects/$PROJECT_NAME/build" C-m
tmux rename-window 'build'

## Main Window
tmux select-window -t $SESSION_NAME:1
tmux send-keys "ranger" C-m
tmux rename-window 'ranger'

# Finally attach to it
tmux attach -t $SESSION_NAME

