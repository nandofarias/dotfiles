# Fish
set -gx fish_greeting "Welcome to Summoner's Rift"

# General
set -x LC_ALL en_US.UTF-8
set -x WORK $HOME/Workspace
set PATH $HOME/bin $HOME/sbin /usr/local/bin $HOME/.local/bin $PATH
set -x EDITOR nvim

# Fix curl
fish_add_path /usr/local/opt/curl/bin

# Android
set -gx ANDROID_HOME $HOME/Library/Android/sdk
set PATH $ANDROID_HOME/tools/bin $ANDROID_HOME/tools $ANDROID_HOME/platform-tools $ANDROID_HOME/emulator $PATH

# Go
set PATH /usr/local/go/bin $PATH
set -x -U GOPATH $HOME/go
set PATH $GOPATH/bin $PATH
set -x GO111MODULE on

# mkcert
test -e mkcert ; and set -gx NODE_EXTRA_CA_CERTS (mkcert -CAROOT)/rootCA.pem

# Ruby
set -gx GEM_HOME $HOME/.gem
set PATH $GEM_HOME/bin $PATH

# Rust
set -gx CARGO_HOME $HOME/.cargo
set PATH $CARGO_HOME/bin $PATH

# Deno
set PATH /Users/nandofarias/.deno/bin $PATH 

# Flutter
set PATH $HOME/Workspace/flutter/bin $PATH

# fnm
set PATH $HOME/.fnm $PATH
/usr/local/bin/fnm env | source

# Elixir/Erlang
set ERL_LIBS /usr/lib/elixir/lib
set -x ERL_AFLAGS "-kernel shell_history enabled"
set ELIXIR_EDITOR code
set PLUG_EDITOR "vscode://file/__FILE__:__LINE__"
set KERL_BUILD_DOCS yes
set CFLAGS "-O2 -g -fno-stack-check -Wno-error=implicit-function-declaration"
set PATH $HOME/.elixir-ls/release $PATH

# Dart
set PATH /usr/lib/dart/bin $PATH

# Import GPG keys
set -x GPG_TTY (tty)

# iTerm
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# Versioning
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# asdf
source ~/.asdf/asdf.fish

set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/libpq/bin" $fish_user_paths

# Aliases
alias mps="mix phx.server"
alias dc="docker-compose"
alias bfg="java -jar $HOME/Workspace/bfg.jar"
alias rest="cmatrix -C black"
alias v="nvim"
alias t="tmux new -s (pwd | sed 's/.*\///g')"
alias ta="tmux attach -t"
alias pluginstall="nvim +PlugInstall +qa"

# Starship
starship init fish | source

# Google Cloud SDK.
if [ -f '/Users/nandofarias/Workspace/google-cloud-sdk/path.fish.inc' ]; . '/Users/nandofarias/Workspace/google-cloud-sdk/path.fish.inc'; end

# Blvd
set MATCHWORKER_PREFER_PREBUILT 1
# Okta
if test -d ~/.okta
	set PATH $HOME/.okta/bin $PATH
	source ~/.okta/fish_functions/okta-aws.fish
	source ~/.okta/fish_functions/okta-sls.fish
end

# Emacs
set -x DOOMDIR $HOME/.doom.d
set PATH $HOME/.emacs.d/bin $PATH

# Zoxide
zoxide init fish | source


