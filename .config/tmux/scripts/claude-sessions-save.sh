#!/usr/bin/env bash
dir="$(tmux show -gqv @resurrect-dir)"
dir="${dir:-$HOME/.local/share/tmux/resurrect}"
dir="${dir/#\~/$HOME}"
mkdir -p "$dir"
out="$dir/claude-sessions.tsv"
tmp="$out.tmp"
: > "$tmp"
tmux list-panes -a -F "#{session_name}:#{window_index}.#{pane_index}	#{pane_pid}	#{pane_current_path}	#{@pane_session_id}" |
  while IFS=$'\t' read -r target pid path sid; do
    [ -n "$sid" ] || continue
    for child in $(pgrep -P "$pid"); do
      case "$(ps -o args= -p "$child")" in
        claude | claude\ * | */claude | */claude\ *)
          printf '%s\t%s\t%s\n' "$target" "$path" "$sid" >>"$tmp"
          break
          ;;
      esac
    done
  done
mv "$tmp" "$out"
