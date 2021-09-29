function tn --description 'Creates a new tmux session'
    test $argv; and tmux new -s $argv; or tmux new -s (pwd | sed 's/.*\///g')
end

function ta --description 'Creates a new tmux session'
    test $argv; and tmux attach -t $argv; or tmux attach -t (pwd | sed 's/.*\///g')
end
