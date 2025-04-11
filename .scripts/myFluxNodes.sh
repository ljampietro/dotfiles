#!/bin/bash
#
#this is a TMUX session with my flux nodes running
#

TMUX=$(type -p tmux) || {
	echo "This script requires $TMUX"
	exit 1
}

SESSION="FluxNodes"

# create new $TMUX session with two panes
$TMUX new-session -d -s $SESSION -n $SESSION
#$TMUX split-window -h -t $SESSION:1
#$TMUX select-pane -t $SESSION:1.1
#$TMUX send-keys "nimbus1" C-m
#$TMUX select-pane -t $SESSION:1.2
$TMUX send-keys "nimbus2" C-m
$TMUX send-keys "fnv" C-m
#$TMUX select-pane -t $SESSION:1.1
#$TMUX send-keys "fnv" C-m
# attach to the new $TMUX session
$TMUX attach-session -t $SESSION
