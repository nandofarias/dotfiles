# Fish
set -x fish_greeting "Welcome to Summoner's Rift"

# General
set -x LC_ALL en_US.UTF-8
set -x WORK $HOME/Workspace
set -x EDITOR nvim
ulimit -n 65536 # See: https://stackoverflow.com/a/45004802 
fish_add_path -g $HOME/.bin $HOME/.local/bin

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
set -x ELIXIR_EDITOR "nvim +__LINE__ __FILE__"
set -x PLUG_EDITOR $ELIXIR_EDITOR
set -x ECTO_EDITOR $ELIXIR_EDITOR
set -x ERL_BUILD_DOCS yes
set -x CFLAGS "-O2 -g -fno-stack-check -Wno-error=implicit-function-declaration"
set -x ELIXIR_ERL_OPTIONS "+S 6:6"
set -x KERL_BUILD_DOCS yes
set -x KERL_INSTALL_MANPAGES yes
set -x KERL_INSTALL_HTMLDOCS yes
fish_add_path -g $HOME/.elixir-ls/release
fish_add_path -g $HOME/.cache/rebar3/bin

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
source ~/.asdf/plugins/java/set-java-home.fish

# Abb
abbr -ag mps "mix phx.server"
abbr -ag dc docker-compose
abbr -ag v nvim
abbr -ag g git
abbr -ag tls "tmux ls"
abbr -ag screen_saver "cmatrix -C green"
abbr -ag plug_sync "nvim +PlugUpdate +PlugInstall +PlugClean! +qa"
abbr -ag vim_profile "nvim --startuptime timeCost.txt timeCost.txt; and rm timeCost.txt"
abbr -ag lsp_logs "tail -f $HOME/.cache/nvim/lsp.log"

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

if [ -z "$TMUX" ]
    tmux attach 2>/dev/null; or exec tmux new-session; and exit
end
