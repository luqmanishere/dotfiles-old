#! /usr/bin/fish

# start by detaching tmux if in one
#
# tmux detach > /dev/null

function call_tmux
  tmux has -t=$PROJECT_NAME
end

function capture_all
    begin;
        begin;
            eval $argv[1]
            set $argv[2] $status  # `read` sets the `status` flag => capture here
        end 2>| read -z __err
    end 1>| read -z __out
    # output arrays
    set $argv[3] (echo $__out | string split \n)
    set $argv[4] (echo $__err | string split \n)
    return 0
end

# Create new session
function ocproject
# starts server temporarily if not started
tmux has || tmux start \; new-session -d 'sleep 10'
printf "OCPROJECT - a cmake project launcher\n"
printf "Launches ranger in window 1, nvim in window 2, changes into build directory on window 3\n"
  if test -n "$TMUX"
    printf "Rerun this function while detached from tmux\n"
    set i 5 4 3 2 1 0
    for num in $i
      printf "Detaching in %d...\n" $num
      if test "$num" -gt 0
        command sleep 1
      else
        command sleep 0.25
      end
    end
    tmux detach
    return
  end
  if count $argv > /dev/null
    
    set PROJECT_NAME $argv[1]
    set SESSION_NAME $argv[2]
    set PROJECT_DIR "$HOME/projects/$PROJECT_NAME"
    set size (tput lines) (tput cols) # $1 = rows $2 = columns
    
    set SESSION_CHECK (tmux has -t=$SESSION_NAME)
    set -g stat
    set -g out
    set -g err
    tmux new -s $SESSION_NAME -x $size[1] -y $size[2] -d

    # Create windows in session
    tmux new-window -t $SESSION_NAME:1 -n 'ranger'
    tmux new-window -t $SESSION_NAME:2 -n 'nvim'
    tmux new-window -t $SESSION_NAME:3 -n 'build'

# Ranger
    tmux select-window -t $SESSION_NAME:1
    tmux send-keys "cd ~/projects/$PROJECT_NAME" C-m
    tmux send-keys "ranger" C-m
    tmux rename-window 'ranger'

## nvim 
    tmux select-window -t $SESSION_NAME:2
    tmux send-keys "cd ~/projects/$PROJECT_NAME" C-m
    tmux send-keys "nvim" C-m
    tmux rename-window 'nvim'

# Build
    tmux select-window -t $SESSION_NAME:3
    tmux send-keys "cd ~/projects/$PROJECT_NAME/build" C-m
    tmux rename-window 'build'

    tmux select-window -t $SESSION_NAME:1
    tmux attach -c $PROJECT_DIR -t $SESSION_NAME
  else
    printf "error: Must be called with arguments\n" $option
    printf "Usage: \n"
    printf "ocproject [window name] [project directory]\n"
  end
end
