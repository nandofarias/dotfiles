#!/usr/bin/env bash
dir="$(tmux show -gqv @resurrect-dir)"
dir="${dir:-$HOME/.local/share/tmux/resurrect}"
dir="${dir/#\~/$HOME}"
file="$dir/claude-sessions.tsv"
[ -s "$file" ] || exit 0
sleep 1
while IFS=$'\t' read -r target path sid; do
  [ -n "$sid" ] || continue
  tmux display -p -t "$target" '' >/dev/null 2>&1 || continue
  tmux send-keys -t "$target" "cd $(printf '%q' "$path") && claude --resume $sid" Enter
done <"$file"
