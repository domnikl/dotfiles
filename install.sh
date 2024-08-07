#!/usr/bin/env zsh

DOTFILES_PATH=$(pwd)

mkdir -p ~/.config/zed
ln -fvs ${DOTFILES_PATH}/zed/settings.json ~/.config/zed/settings.json

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
	  ln -fvs "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

for rcfile in "$DOTFILES_PATH"/.*(.N); do
	  ln -fvs "$rcfile" "${ZDOTDIR:-$HOME}/${rcfile:t}"
done

echo
echo "now change your default shell to zsh: \`chsh -s /bin/zsh\`, open a new terminal"
echo
echo "and ENJOY."
