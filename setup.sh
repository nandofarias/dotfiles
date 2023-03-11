#!/bin/sh

if ! command -v brew &>/dev/null; then
  echo 'Homebrew not installed, installing...'
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo 'Cloning dotfiles...'
git clone --bare git@github.com:nandofarias/dotfiles.git $HOME/.cfg
git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout

echo 'Insalling brew packages...'
brew bundle
