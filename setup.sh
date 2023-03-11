#!/bin/sh

if ! command -v brew &>/dev/null; then
  echo "Homebrew not found. Installing …"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

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
  git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout
fi

echo "Installing brew packages …"
brew bundle

echo "All good to go!"
