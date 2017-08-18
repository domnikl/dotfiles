#!/bin/sh

DOTFILES_PATH=$(pwd)

cd $HOME
ln -fs $DOTFILES_PATH/.bashrc .bashrc
ln -fs $DOTFILES_PATH/.gemrc .gemrc
ln -fs $DOTFILES_PATH/.gitconfig .gitconfig
ln -fs $DOTFILES_PATH/.vimrc .vimrc
cd -

if type "defaults" > /dev/null; then
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
fi

