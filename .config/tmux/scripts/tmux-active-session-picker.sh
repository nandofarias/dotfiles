#!/usr/bin/env bash
set -euo pipefail

current_session="$(tmux display-message -p '#S')"
now="$(date +%s)"
sep='|||'
cache_dir="${TMPDIR:-/tmp}/tmux-sidebar-status"
cache_file="$cache_dir/sessions.txt"
cache_ttl=4
mkdir -p "$cache_dir"

select_status_pane() {
  local session="$1"

  tmux list-panes -t "$session" -F '#{pane_id}	#{pane_active}	#{pane_current_command}	#{pane_last}' \
    | awk -F '\t' '
        $3 != "tv" && $2 == "1" { print $1; found=1; exit }
        $3 != "tv" { rows[++n]=$0 }
        END {
          if (found) exit
          best=""
          best_last=-1
          for (i=1; i<=n; i++) {
            split(rows[i], parts, "\t")
            if (parts[4] > best_last) {
              best_last=parts[4]
              best=parts[1]
            }
          }
          if (best != "") print best
        }
      ' | head -n1
}

format_age() {
  local age="$1"
  if [ "$age" -ge 999999 ] 2>/dev/null; then
    printf '?'
  elif [ "$age" -lt 60 ]; then
    printf '%ss' "$age"
  elif [ "$age" -lt 3600 ]; then
    printf '%sm' $((age / 60))
  else
    printf '%sh' $((age / 3600))
  fi
}

classify_session() {
  local session="$1"
  local pane_id cmd activity line_age tail_text status detail lc age_label

  pane_id="$(select_status_pane "$session")"
  if [ -z "$pane_id" ]; then
    printf 'IDLE\t%s\t[?] no usable pane\n' "$session"
    return
  fi

  cmd="$(tmux display-message -p -t "$pane_id" '#{pane_current_command}')"
  activity="$(tmux display-message -p -t "$pane_id" '#{pane_activity}')"
  tail_text="$(tmux capture-pane -p -t "$pane_id" -S -20 2>/dev/null | tail -n 12 | tr '\n' ' ' | tr '\t' ' ' | sed 's/  */ /g' | cut -c1-64)"
  lc="$(printf '%s %s' "$cmd" "$tail_text" | tr '[:upper:]' '[:lower:]')"

  if [ -n "$activity" ] && [ "$activity" -gt 0 ] 2>/dev/null; then
    line_age=$((now - activity))
  else
    line_age=999999
  fi

  age_label="$(format_age "$line_age")"

  status="IDLE"
  detail="[$age_label] $cmd"

  if printf '%s' "$lc" | grep -Eqi '(approve|approval|allow|deny|yes/no|\[y/n\]|\(y/n\)|proceed\?|continue\?|press enter|select an option|choose an option|confirm)'; then
    status="WAIT"
    detail="[$age_label] input needed · $cmd"
  elif printf '%s' "$lc" | grep -Eqi '(error|failed|failure|exception|traceback|fatal|panic)'; then
    status="ERR"
    detail="[$age_label] error detected · $cmd"
  elif printf '%s' "$lc" | grep -Eqi '(complete(d)?|done|finished|success|successful)'; then
    if [ "$line_age" -gt 20 ]; then
      status="DONE"
      detail="[$age_label] task complete · $cmd"
    else
      status="BUSY"
      detail="[$age_label] wrapping up · $cmd"
    fi
  elif [ "$line_age" -le 20 ]; then
    status="BUSY"
    detail="[$age_label] active · $cmd"
  else
    status="IDLE"
    detail="[$age_label] $cmd"
  fi

  printf '%s\t%s\t%s\n' "$status" "$session" "$detail"
}

status_rank() {
  case "$1" in
    WAIT) echo 1 ;;
    ERR) echo 2 ;;
    BUSY) echo 3 ;;
    DONE) echo 4 ;;
    IDLE) echo 5 ;;
    *) echo 9 ;;
  esac
}

render_rows() {
  tmux list-sessions -F '#{session_name}' | grep -vx "$current_session" | while IFS= read -r session; do
    [ -n "$session" ] || continue
    row="$(classify_session "$session")"
    status="$(printf '%s' "$row" | cut -f1)"
    name="$(printf '%s' "$row" | cut -f2)"
    detail="$(printf '%s' "$row" | cut -f3-)"
    rank="$(status_rank "$status")"
    printf '%s\t%-5s %-18s %s%s%s\n' "$rank" "$status" "$name" "$detail" "$sep" "$name"
  done | sort -t $'\t' -k1,1n -k2,2 | cut -f2-
}

if [ -f "$cache_file" ]; then
  mtime="$(stat -f '%m' "$cache_file" 2>/dev/null || echo 0)"
else
  mtime=0
fi

if [ $((now - mtime)) -gt "$cache_ttl" ]; then
  render_rows > "$cache_file"
fi

selection="$(cat "$cache_file" | tv \
  --source-command 'cat' \
  --input-header 'Active tmux sessions' \
  --source-display '{}' \
  --source-output '{}' \
  --no-preview \
  --no-remote \
  --no-help-panel)"

if [ -n "${selection:-}" ]; then
  session_name="${selection##*${sep}}"
  tmux switch-client -t "$session_name"
fi
