# dotfiles

These are my dotfiles, living a happy life in `~`.

## Installation

Clone this repo and run:

```sh
brew install direnv atuin fzf htop krew helm kustomize node python wget zsh direnv

sh -c "$(wget -O- https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"

cd $HOME && git clone git@github.com:domnikl/dotfiles.git && \
    cd dotfiles && pip install -r requirements.txt && \
    stow .
```

Depending on the system and the terminal the dotfiles are used in, you may need to run Powerlevel10k setup again. Do so by running `p10k configure` and the assistant will guide you through the setup.

## Font

I use the MesloLGS NF font available [here](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k). Be sure to use that wherever your terminal runs (VSCode, IntelliJ IDEA, iTerm etc.).

## Other useful tools

```sh
npm install --global git-open
```
