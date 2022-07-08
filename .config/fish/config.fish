# Fish
set -gx fish_greeting "Welcome to Summoner's Rift"

# General
set -gx LC_ALL en_US.UTF-8
set -gx WORK $HOME/Workspace
set -gx EDITOR nvim
ulimit -n 65536 # See: https://stackoverflow.com/a/45004802
fish_add_path -g $HOME/.bin $HOME/.local/bin

# Fix curl
fish_add_path -g /usr/local/opt/curl/bin

# Android
set -gx ANDROID_HOME $HOME/Library/Android/sdk
fish_add_path -g $ANDROID_HOME/tools/bin $ANDROID_HOME/tools $ANDROID_HOME/platform-tools $ANDROID_HOME/emulator

# Go
fish_add_path -g /usr/local/go/bin
set -gx GOPATH $HOME/go
fish_add_path -g $GOPATH/bin
set -gx GO111MODULE on

# mkcert
test -e mkcert; and set -gx NODE_EXTRA_CA_CERTS (mkcert -CAROOT)/rootCA.pem

# Ruby
set -gx GEM_HOME $HOME/.gem
fish_add_path -g $GEM_HOME/bin

# Rust
set -gx CARGO_HOME $HOME/.cargo
fish_add_path -g $CARGO_HOME/bin

# Deno
fish_add_path -g /Users/nandofarias/.deno/bin

# Flutter
fish_add_path -g $HOME/Workspace/flutter/bin

# Elixir/Erlang
set -gx ERL_LIBS /usr/lib/elixir/lib
set -gx ERL_AFLAGS "-kernel shell_history enabled"
set -gx ELIXIR_EDITOR "nvim +__LINE__ __FILE__"
set -gx PLUG_EDITOR $ELIXIR_EDITOR
set -gx ERL_BUILD_DOCS yes
set -gx CFLAGS "-O2 -g -fno-stack-check -Wno-error=implicit-function-declaration"
set -gx KERL_BUILD_DOCS yes
set -gx KERL_INSTALL_MANPAGES yes
set -gx KERL_INSTALL_HTMLDOCS yes
set -gx KERL_CONFIGURE_OPTIONS "\
      --disable-debug \
      --disable-silent-rules \
      --enable-dynamic-ssl-lib \
      --enable-hipe \
      --enable-shared-zlib \
      --enable-smp-support \
      --enable-threads \
      --enable-wx \
      --enable-webview \
      --with-ssl=(brew --prefix openssl@1.1) \
      --without-javac
      --enable-darwin-64bit \
      --enable-kernel-poll \
      --enable-gettimeofday-as-os-system-time \
      --with-dynamic-trace=dtrace"
fish_add_path -g $HOME/.elixir-ls/release
fish_add_path -g $HOME/.cache/rebar3/bin

# Dart
fish_add_path -g /usr/lib/dart/bin

# Import GPG keys
set -gx GPG_TTY (tty)

# iTerm
test -e {$HOME}/.iterm2_shell_integration.fish; and source {$HOME}/.iterm2_shell_integration.fish

# asdf
source ~/.asdf/asdf.fish
source ~/.asdf/plugins/java/set-java-home.fish

# Abb
abbr -ag mps "iex -S mix phx.server"
abbr -ag iem "iex -S mix"
abbr -ag mcs "watchexec -e ex mix compile"

abbr -ag dc docker-compose

abbr -ag g git
abbr -ag gc "git checkout"

abbr -ag tls "tmux ls"

abbr -ag ss "cmatrix -C green"

abbr -ag v nvim
abbr -ag vim nvim
abbr -ag update-nvim 'asdf uninstall neovim nightly && asdf install neovim nightly'
abbr -ag plug-sync "nvim +PlugClean! +PlugUpdate +PlugInstall"
abbr -ag vim-profile "nvim --startuptime timeCost.txt timeCost.txt; and rm timeCost.txt"
abbr -ag lsp-logs "tail -f $HOME/.local/state/nvim/lsp.log"

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
set -gx DOOMDIR $HOME/.doom.d
fish_add_path -g $HOME/.emacs.d/bin

# Zoxide
zoxide init fish | source

# McFly
mcfly init fish | source
set -gx MCFLY_KEY_SCHEME vim
set -gx MCFLY_FUZZY true
set -gx MCFLY_RESULTS 50

# Source functions https://github.com/fish-shell/fish-shell/issues/5034
source ~/.config/fish/functions/tmux.fish

# radicle.xyz
fish_add_path -g $HOME/.radicle/bin

# Python 3.9
fish_add_path -g $HOME/Library/Python/3.9/bin

# Homebrew
set -gx HOMEBREW_BUNDLE_FILE ~/.config/brew/Brewfile

# Bun
set -Ux BUN_INSTALL "$HOME/.bun"
set -px --path PATH "$HOME/.bun/bin"

# git-pile
set -gx GIT_PILE_PREFIX ff-
