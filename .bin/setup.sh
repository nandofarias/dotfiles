#!/bin/bash

xcode-select -p &> /dev/null
if [ $? -ne 0 ]; then
  echo "Command Line Tools for Xcode not found. Installing …"
  # This temporary file prompts the "softwareupdate" utility to list the Command Line Tools
  touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
  PROD=$(softwareupdate -l | grep "\*.*Command Line" | tail -n 1 | sed "s/^[^C]* //")
  softwareupdate -i "$PROD" --verbose;
fi

DOTFILES="$HOME/.cfg"
if [ ! -d "$DOTFILES" ]; then
  echo "Dotfiles not found. Cloning …"
  git clone --bare https://github.com/nandofarias/dotfiles.git $HOME/.cfg
  alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
  config checkout
  config config --local status.showUntrackedFiles no
  config remote set-url origin git@github.com:nandofarias/dotfiles.git
fi

if ! command -v brew &>/dev/null; then
  echo "Homebrew not found. Installing …"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "Installing brew packages …"
export HOMEBREW_BUNDLE_FILE=~/.config/brew/Brewfile
brew bundle

echo "Setting up fish …"
echo $(which fish) | sudo tee -a /etc/shells
chsh -s $(which fish)
if ! command -v brew &>/dev/null; then
  curl -sS https://starship.rs/install.sh | sh
fi

echo "Setting up tmux …"
tic -x ~/.config/tmux/tmux.terminfo
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins

echo "Setting up languages and tools …"
rtx install

echo "Install npm packages …"
npmg

echo "Setting macos defaults …"
~/.bin/macos

echo "All good to go!"
