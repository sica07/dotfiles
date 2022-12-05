#!/bin/bash

session="scratch"
tmux has-session -t $session 2>/dev/null
if [ $? != 0 ]; then
    tmux new -s $session
fi
tmux attach-session -t $session
