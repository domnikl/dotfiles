#!/usr/bin/env bash

DOTFILES_PATH=$(pwd)

cd $HOME
ln -fs $DOTFILES_PATH/.bashrc .bashrc
ln -fs $DOTFILES_PATH/.bashrc .profile
ln -fs $DOTFILES_PATH/.gemrc .gemrc
ln -fs $DOTFILES_PATH/.gitconfig .gitconfig
ln -fs $DOTFILES_PATH/.vimrc .vimrc
cd -

# setup Fira Code font
FIRA_CODE_VERSION="1.205"
FONT="FiraCode_$FIRA_CODE_VERSION"
wget https://github.com/tonsky/FiraCode/releases/download/$FIRA_CODE_VERSION/$FONT.zip -O $TMPDIR/$FONT.zip
unzip -o -d $TMPDIR/$FONT $TMPDIR/$FONT.zip

# copy fonts to ~/Library/Fonts to install them
find $TMPDIR/$FONT -name *.ttf -exec cp {} ~/Library/Fonts \;

# install itermcolors
open "domnikl.itermcolors"

echo "setting MAC defaults ..."

# stop scrollbars from disappearing
defaults write -g NSOverlayScrollerShowOnMouseOver -bool TRUE

# use dark toolbar in fullscreen
defaults write -g NSFullScreenDarkMenu -bool TRUE

# turn of trash sound effect
defaults write com.apple.finder FinderSounds -bool FALSE;killall Finder

# Using a Better Path Bar
defaults write com.apple.finder PathBarRootAtHome -bool TRUE;killall Finder

# Show Full Paths in the Title Bar of Finder
defaults write com.apple.finder _FXShowPosixPathInTitle -bool TRUE; killall Finder

# Turn Off Download "Quarantining"
defaults write com.apple.LaunchServices LSQuarantine -bool FALSE

# scroll over a dock icon to show windows
defaults write com.apple.dock scroll-to-open -bool TRUE;killall Dock

# indicate hidden app icons in dock
defaults write com.apple.dock showhidden -bool TRUE; killall Dock


tput bold
echo ""
echo "Done ☀️ But what is there left to do manually?"
echo ""
echo "=> changing color preset in iTerm2"
echo "=> setup VSCode and other editors to use Fira Code Retina (and ligatures)"
echo "=> be productive"
