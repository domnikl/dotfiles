#!/usr/bin/env zsh

DOTFILES_PATH=$(pwd)

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

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
