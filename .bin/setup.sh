#!/bin/bash

xcode-select -p &> /dev/null
if [ $? -ne 0 ]; then
  echo "Command Line Tools for Xcode not found. Installing …"
  # This temporary file prompts the "softwareupdate" utility to list the Command Line Tools
  touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
  PROD=$(softwareupdate -l | grep "\*.*Command Line" | tail -n 1 | sed "s/^[^C]* //")
  softwareupdate -i "$PROD" --verbose;
fi

echo "Installing rosetta and xcode comand line tools …"
softwareupdate --install-rosetta
xcode-select --install

DOTFILES="$HOME/.cfg"
if [ ! -d "$DOTFILES" ]; then
  echo "Dotfiles not found. Cloning …"
  git clone --bare https://github.com/nandofarias/dotfiles.git $HOME/.cfg
  alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
  config checkout
  config config --local status.showUntrackedFiles no
  # config remote set-url origin git@github.com:nandofarias/dotfiles.git
fi

if ! command -v brew &>/dev/null; then
  echo "Homebrew not found. Installing …"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "Installing brew packages …"
export HOMEBREW_BUNDLE_FILE=~/.config/brew/Brewfile
export HOMEBREW_FORCE_BREWED_CURL=1
brew update --auto-update
brew bundle install
if [ ! -d /Applications/Kiri.app ]; then
  echo "Installing Kiri …"
  kiri_dmg="$(mktemp -d)/Kiri.dmg"
  curl -fsSL -o "$kiri_dmg" "$(curl -fsSL https://api.github.com/repos/libracoder/kiri/releases/latest | grep -o 'https://[^"]*-arm64\.dmg' | head -1)"
  kiri_mnt="$(hdiutil attach -nobrowse -readonly "$kiri_dmg" | awk -F'\t' '/\/Volumes\//{print $NF}')"
  ditto "$kiri_mnt/Kiri.app" /Applications/Kiri.app
  hdiutil detach "$kiri_mnt" -quiet
  mkdir -p "$HOME/.kiri"
  [ -e "$HOME/.kiri/share.json" ] || printf '{\n  "server": "127.0.0.1:9",\n  "device": ""\n}\n' > "$HOME/.kiri/share.json"
  /Applications/Kiri.app/Contents/MacOS/kiri setup --use
fi

echo "Setting up fish …"
echo $(which fish) | sudo tee -a /etc/shells
chsh -s $(which fish)
if ! command -v brew &>/dev/null; then
  curl -sS https://starship.rs/install.sh | sh
fi

echo "Setting up neovim …"
nvim --headless "+Lazy! restore" +qa

echo "Setting up tmux …"
tic -x ~/.config/tmux/tmux.terminfo
if test ! -d ~/.config/tmux/plugins/tpm; then
    mkdir ~/.config/tmux/plugins
    git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
fi
~/.config/tmux/plugins/tpm/bin/install_plugins
bash ~/.config/tmux/plugins/tmux-agent-sidebar/install-wizard.sh download-binary || true

echo "Setting up languages and tools …"
mise install
command -v no-mistakes >/dev/null || curl -fsSL https://raw.githubusercontent.com/kunchenguid/no-mistakes/main/docs/install.sh | sh

echo "Setting up the Brain vault …"
[ -d "$HOME/Brain/.git" ] || gh repo clone nandofarias/brain "$HOME/Brain"
qmd update && qmd embed
launchctl bootstrap "gui/$(id -u)" "$HOME/Library/LaunchAgents/com.ffarias.brain-sync.plist" 2>/dev/null || true

echo "Setting up Claude Code plugins …"
if command -v claude &>/dev/null; then
  claude plugin marketplace add ~/.config/tmux/plugins/tmux-agent-sidebar
  claude plugin install tmux-agent-sidebar@hiroppy
else
  echo "claude not found, skipping (rerun the two 'claude plugin' lines later)"
fi

echo "Installing tuicr agent skill …"
~/.bin/tuicr-skill-update || echo "tuicr skill install failed, rerun ~/.bin/tuicr-skill-update later"

echo "Setting macos defaults …"
~/.bin/macos

echo "All good to go!"
