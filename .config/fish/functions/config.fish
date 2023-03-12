function config --wraps='git' --description 'config dotfiles'
    git --git-dir=$HOME/.cfg/ --work-tree=$HOME $argv
end
