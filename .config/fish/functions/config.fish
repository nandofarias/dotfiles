function config --wraps='git' --description 'config dotfiles'
    /usr/local/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $argv
end
