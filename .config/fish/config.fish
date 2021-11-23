# Fish
set -x fish_greeting "Welcome to Summoner's Rift"
# Fix functions descriptions https://github.com/fish-shell/fish-shell/issues/328
for i in (functions)
    functions $i >/dev/null
end
# General
set -x LC_ALL en_US.UTF-8
set -x WORK $HOME/Workspace
set -x EDITOR nvim
ulimit -n 65536 # See: https://stackoverflow.com/a/45004802 
fish_add_path -g $HOME/bin $HOME/.local/bin

# Vim mode
fish_hybrid_key_bindings

# Fix curl
fish_add_path -g /usr/local/opt/curl/bin

# Android
set -x ANDROID_HOME $HOME/Library/Android/sdk
fish_add_path -g $ANDROID_HOME/tools/bin $ANDROID_HOME/tools $ANDROID_HOME/platform-tools $ANDROID_HOME/emulator

# Go
fish_add_path -g /usr/local/go/bin
set -x GOPATH $HOME/go
fish_add_path -g $GOPATH/bin
set -x GO111MODULE on

# mkcert
test -e mkcert; and set -x NODE_EXTRA_CA_CERTS (mkcert -CAROOT)/rootCA.pem

# Ruby
set -x GEM_HOME $HOME/.gem
fish_add_path -g $GEM_HOME/bin

# Rust
set -x CARGO_HOME $HOME/.cargo
fish_add_path -g $CARGO_HOME/bin

# Deno
fish_add_path -g /Users/nandofarias/.deno/bin

# Flutter
fish_add_path -g $HOME/Workspace/flutter/bin

# fnm
fish_add_path -g $HOME/.fnm
/usr/local/bin/fnm env | source

# Elixir/Erlang
set -x ERL_LIBS /usr/lib/elixir/lib
set -x ERL_AFLAGS "-kernel shell_history enabled"
set -x PLUG_EDITOR "vscode://file/__FILE__:__LINE__"
set -x ERL_BUILD_DOCS yes
set -x CFLAGS "-O2 -g -fno-stack-check -Wno-error=implicit-function-declaration"
set -x ELIXIR_ERL_OPTIONS "+S 6:6"
fish_add_path -g $HOME/.elixir-ls/release

# Dart
fish_add_path -g /usr/lib/dart/bin

# Import GPG keys
set -x GPG_TTY (tty)

# iTerm
test -e {$HOME}/.iterm2_shell_integration.fish; and source {$HOME}/.iterm2_shell_integration.fish

# Versioning
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# asdf
source ~/.asdf/asdf.fish

# Abb
abbr -ag mps "mix phx.server"
abbr -ag dc docker-compose
abbr -ag v nvim
abbr -ag g git
abbr -ag tls "tmux ls"
abbr -ag screen_saver "cmatrix -C green"
abbr -ag plug_sync "nvim +PlugUpdate +PlugInstall +PlugClean! +qa"
abbr -ag vim_profile "nvim --startuptime timeCost.txt timeCost.txt; and rm timeCost.txt"

# Starship
starship init fish | source

# Google Cloud SDK.
if [ -f '/Users/nandofarias/Workspace/google-cloud-sdk/path.fish.inc' ]
    . '/Users/nandofarias/Workspace/google-cloud-sdk/path.fish.inc'
end

# Blvd
set MATCHWORKER_PREFER_PREBUILT 1
# Okta
if test -d ~/.okta
    fish_add_path -g $HOME/.okta/bin
    source ~/.okta/fish_functions/okta-aws.fish
    source ~/.okta/fish_functions/okta-sls.fish
end

# Emacs
set -x DOOMDIR $HOME/.doom.d
fish_add_path -g $HOME/.emacs.d/bin

# Zoxide
zoxide init fish | source

# McFly
mcfly init fish | source
set -x MCFLY_KEY_SCHEME vim
set -x MCFLY_FUZZY true
set -x MCFLY_RESULTS 50
