# dotfiles

These are my dotfiles, living a happy life in `~`.

## Installation

Clone this repo and run:

```
brew install direnv htop krew helm kafka kcat kustomize node python@3.9 wget zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"
./install.sh
```

To install Python dependencies required for running some of the scripts, do the following:

```sh
pip3 install -r requirements.txt
```

Depending on the system and the terminal the dotfiles are used in, you may need to run Powerlevel10k setup again. Do so by running `p10k configure` and the assistant will guide you through the setup.

## Font

I use the MesloLGS NF font available [here](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k). Be sure to use that wherever your terminal runs (VSCode, IntelliJ IDEA, iTerm, Hyper, etc.).

## Other useful tools

```sh
npm install --global git-open
```
