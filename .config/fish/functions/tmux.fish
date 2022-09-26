function ta --description 'Attach or creates a new tmux session'
    tmux new-session -A -s $argv
end
