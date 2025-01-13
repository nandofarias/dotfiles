XDG_CONFIG_HOME=${XDG_CONFIG_HOME:=$HOME/.config}
files=(
    config.zsh
    checks.zsh
    setopt.zsh
    exports.zsh
    completion.zsh
    functions.zsh
    aliases.zsh
    bindkeys.zsh
    path.zsh
    history.zsh
    zsh_hooks.zsh
    fzf.zsh
    colors.zsh
    tmux.zsh
    theme.zsh
    local.zsh
 )

export LC_ALL=en_US.UTF-8

for file in ${files[*]}
do
    [[ -f "$XDG_CONFIG_HOME/zsh/${file}" ]] && source "$XDG_CONFIG_HOME/zsh/${file}"
done
