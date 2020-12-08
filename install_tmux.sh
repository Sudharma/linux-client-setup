#!/bin/bash

git clone https://github.com/jonmosco/kube-tmux.git ~/.tmux

cat <<EOF >> ~/.tmux.conf
setw -g mouse on

# Set scrollback buffer to 10000
set -g history-limit 10000

# Customize the status line
set -g status-fg  green
set -g status-bg  black

# needed for vim settings
set -g default-terminal "xterm"

# k8s
set -g status-right "#(/bin/bash $HOME/.tmux/kube.tmux 250 red cyan)"

EOF

#https://github.com/tmux/tmux/issues/699
