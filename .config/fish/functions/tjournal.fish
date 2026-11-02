# Keep tui-journal's config in ~/.config (dotfiles) instead of ~/Library/Application Support
function tjournal --wraps tjournal --description 'tui-journal with ~/.config/tui-journal config'
    command tjournal -c ~/.config/tui-journal $argv
end
