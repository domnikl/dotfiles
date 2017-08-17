#!/bin/sh

set -e

DOTFILES_PATH=$(pwd)

cd $HOME
ln -fs $DOTFILES_PATH/.bashrc .bashrc
ln -fs $DOTFILES_PATH/.gemrc .gemrc
ln -fs $DOTFILES_PATH/.gitconfig .gitconfig
ln -fs $DOTFILES_PATH/.vimrc .vimrc
cd -
