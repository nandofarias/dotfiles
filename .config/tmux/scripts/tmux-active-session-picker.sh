#!/usr/bin/env bash
set -euo pipefail

current_session="$(tmux display-message -p '#S')"

selection="$({
  tmux list-sessions -F '#{session_name}' | grep -vx "$current_session" || true
} | tv \
  --source-command 'cat' \
  --input-header 'Active tmux sessions' \
  --source-display '{}' \
  --source-output '{}' \
  --no-preview \
  --no-remote \
  --no-help-panel)"

if [ -n "${selection:-}" ]; then
  tmux switch-client -t "$selection"
fi
