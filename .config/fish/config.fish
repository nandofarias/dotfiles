if status is-interactive
  # Fish
  set -gx fish_greeting "Welcome to Summoner's Rift"

  # General
  set -gx LC_ALL en_US.UTF-8
  set -gx WORK $HOME/Workspace
  set -gx EDITOR nvim
  ulimit -n 65536 # See: https://stackoverflow.com/a/45004802
  fish_add_path -g $HOME/.bin $HOME/.local/bin

  # Homebrew
  set -gx HOMEBREW_BUNDLE_FILE ~/.config/brew/Brewfile
  if [ -s "/opt/homebrew/bin/brew" ];
    eval "$(/opt/homebrew/bin/brew shellenv)"
  end
  if [ -s "/usr/local/bin/brew" ];
    eval "$(/usr/local/bin/brew shellenv)"
  end

  # Fix curl
  set -gx HOMEBREW_FORCE_BREWED_CURL 1
  if [ -s "/usr/local/opt/curl" ];
    fish_add_path -g /usr/local/opt/curl/bin
  end
  if [ -s "/opt/homebrew/opt/curl" ];
    fish_add_path -g /opt/homebrew/opt/curl/bin
  end

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
        --disable-jit \
        --disable-silent-rules \
        --disable-debug \
        --disable-sctp \
        --enable-gettimeofday-as-os-system-time \
        --enable-dynamic-ssl-lib \
        --enable-darwin-64bit \
        --enable-kernel-poll \
        --enable-shared-zlib \
        --enable-smp-support \
        --enable-threads \
        --enable-hipe \
        --enable-wx \
        --with-dynamic-trace=dtrace \
        --without-jinterface \
        --without-javac \
        --without-wx \
  "
  fish_add_path -g $HOME/.elixir-ls/release
  fish_add_path -g $HOME/.cache/rebar3/bin

  # Dart
  fish_add_path -g /usr/lib/dart/bin

  # Import GPG keys
  set -gx GPG_TTY (tty)

  # iTerm
  test -e {$HOME}/.iterm2_shell_integration.fish; and source {$HOME}/.iterm2_shell_integration.fish

  # Abbreviations
  abbr -ag mps "iex -S mix phx.server"
  abbr -ag iem "iex -S mix"
  abbr -ag mcs "watchexec -e ex mix compile"

  abbr -ag dc docker-compose

  abbr -ag g git
  abbr -ag gc "git checkout"
  abbr -ag lg lazygit
  abbr -ag lc "lazygit -g ~/.cfg"

  abbr -ag tls "tmux ls"
  abbr -ag tn "tmux new -s"
  abbr -ag ta "tmux attach -t"
  abbr -ag tc "sesh connect (sesh list | fzf)"

  abbr -ag ss "cmatrix -C blue"

  abbr -ag v nvim
  abbr -ag vu 'mise uninstall neovim@stable && mise install neovim@stable'
  abbr -ag vup 'nvim --headless "+Lazy! sync" +qa'
  abbr -ag vrp 'nvim --headless "+Lazy! restore" +qa'
  abbr -ag vp "nvim --startuptime timeCost.txt timeCost.txt; and rm timeCost.txt"
  abbr -ag lsp-logs "tail -f $HOME/.local/state/nvim/lsp.log"

  abbr -ag barenvim "nvim -u NONE"

  abbr -ag icat "kitty icat"

  # aliases
  alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
  alias ic='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'
  alias snowsql=/Applications/SnowSQL.app/Contents/MacOS/snowsql
  alias tldrf='tldr --list | fzf --preview "tldr {1}" --preview-window=right,70% | xargs tldr'

  # Starship
  starship init fish | source

  # Google Cloud SDK.
  if [ -f '/Users/nandofarias/Workspace/google-cloud-sdk/path.fish.inc' ]
      . '/Users/nandofarias/Workspace/google-cloud-sdk/path.fish.inc'
  end

  # Blvd
  set MATCHWORKER_PREFER_PREBUILT 1
  set DATABASE_POOL_SIZE 50

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

  # radicle.xyz
  fish_add_path -g $HOME/.radicle/bin

  # Python 3.9
  fish_add_path -g $HOME/Library/Python/3.9/bin

  # git-pile
  set -gx GIT_PILE_PREFIX ff-

  # colima
  # set -gx DOCKER_HOST "unix://$HOME/.colima/default/docker.sock"

  # mise
  set -gx MISE_QUIET 1
  mise activate fish | source

  # direnv
  set -gx DIRENV_LOG_FORMAT ""
  direnv hook fish | source

  # global npm
  fish_add_path -g ~/.npmbin/node_modules/.bin

  # jira
  jira completion fish | source

  # op plugins
  source ~/.config/op/plugins.sh
end
