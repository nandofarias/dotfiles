#!/usr/bin/env bash
tmux bind -n C-h run "(tmux display-message -p '#{pane_title}' | grep -iq vim && tmux send-keys C-h) || tmux select-pane -L"
tmux bind -n C-j run "(tmux display-message -p '#{pane_title}' | grep -iq vim && tmux send-keys C-j) || tmux select-pane -D"
tmux bind -n C-k run "(tmux display-message -p '#{pane_title}' | grep -iq vim && tmux send-keys C-k) || tmux select-pane -U"
tmux bind -n C-l run "(tmux display-message -p '#{pane_title}' | grep -iq vim && tmux send-keys C-l) || tmux select-pane -R"
