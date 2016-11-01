#!/bin/bash

function install_tmux {
    source ./utils.sh

    install_deb "tmux"

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

bind-key J resize-pane -D 5
bind-key K resize-pane -U 5
bind-key H resize-pane -L 5
bind-key L resize-pane -R 5

bind-key j resize-pane -D
bind-key k resize-pane -U
bind-key h resize-pane -L
bind-key l resize-pane -R

setw -g mode-keys vi
setw -g monitor-activity on
EOF
}
