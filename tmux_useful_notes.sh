#!/bin/bash

SESSION_NAME="useful_notes"
HOME="/root/cian"

tmux start-server

tmux new-session -d -s $SESSION_NAME -n useful_cmds
tmux send-keys "cd ~/useful_files" C-m
tmux send-keys "v useful_cmds.sh"

tmux new-window -n notes
tmux send-keys "cd ~/vimwiki" C-m
tmux send-keys "v todo.wiki"

tmux new-window
tmux send-keys "cd ~/dotfiles" C-m

tmux new-window
tmux send-keys "cd ~/intel_dotfiles" C-m

tmux select-window -t $SESSION_NAME:1
tmux -u attach-session -t $SESSION_NAME
