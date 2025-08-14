#!/usr/bin/env zsh

set -euo pipefail

DOTFILES_PATH=$(pwd)

if ! [ -x "$(command -v stow)" ]; then
  echo 'Error: stow is not installed.' >&2
  exit 1
fi

stow --ignore install.sh --ignore .DS_Store --ignore iTerm.json --ignore renovate.json --ignore requirements.txt .
ln -s ~/dotfiles/guidelines.personal.md ~/.claude/CLAUDE.md

echo
echo "now change your default shell to zsh: \`chsh -s /bin/zsh\`, open a new terminal"
echo
echo "and ENJOY."
