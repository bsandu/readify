#!/bin/bash

./install_vim.sh

which tmux || sudo apt-get install -y --allow tmux
which curl || sudo apt-get install -y --allow curl
which htop || sudo apt-get install -y --allow htop

cat > ~/.tmux.conf <<EOF
# remap prefix from 'C-b' to 'C-s'
unbind C-b
set-option -g prefix C-s
bind-key C-s send-prefix

bind | split-window -h
bind - split-window -v
unbind '"'
unbind %

bind -n C-Left select-pane -L
bind -n C-Right select-pane -R
bind -n C-Up select-pane -U
bind -n C-Down select-pane -D
EOF
