#!/usr/bin/env bash
set -euo pipefail

pane_id="${1:?pane id required}"
window_id="$(tmux display-message -p -t "$pane_id" '#{window_id}')"
current_path="$(tmux display-message -p -t "$pane_id" '#{pane_current_path}')"

existing_pane="$(tmux list-panes -t "$window_id" -F '#{pane_id} #{pane_current_command} #{pane_start_command}' | awk '$2 == "tv" && $0 ~ /tv sesh/ { print $1; exit }')"

if [ -n "$existing_pane" ]; then
  tmux kill-pane -t "$existing_pane"
else
  tmux split-window -h -b -l 30% -c "$current_path" 'exec ~/.config/tmux/scripts/tmux-active-session-picker.sh'
fi
