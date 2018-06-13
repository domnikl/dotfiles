DIR=`readlink ~/.bashrc`
DIR=`dirname "$DIR"`

# basic settings
export PATH=$DIR/bin:$PATH:$GOPATH/bin:/usr/local/opt/go/libexec/bin
export EDITOR="vim"

# ignore case on bash completion
bind 'set completion-ignore-case on'

# ignore duplicates in bash history
export HISTCONTROL=ignoredups

# settings for Golang
export GOPATH=$HOME/Workspace/go

# settings for Erlang/Elixir
export ELIXIR_EDITOR="$EDITOR"
export ERL_AFLAGS="-kernel shell_history enabled"

# aliases (git)
alias gs="git status --show-stash"
alias gsf="gs -v"
alias gap="git add -p"
alias gdc="git diff --cached"

# aliases (ls)
alias ls="command ls -G" # always use colored output for `ls`
alias ll='ls -lh' # list all files colorized in long format

function get_git_changes {
    tput bold

    local __branch=`git rev-parse --symbolic --abbrev-ref HEAD 2> /dev/null | tr -d '\n'`
    local __number_of_changed_files=`git diff --name-only HEAD 2> /dev/null | wc -l | sed -E s/[^0-9]//g`

    if [ -z "$__branch" ]; then
        tput setaf 9
        echo "(no branch) 🤓 "
    elif [ ! -z "$__branch" ] && (( "$__number_of_changed_files" > 0 )); then
        tput setaf 3
        echo -n "$__branch 🤔 "
        tput setaf 9
        echo "(+$__number_of_changed_files) "
    elif [ ! -z "$__branch" ]; then
        tput setaf 3
        echo "$__branch 👍 "
    fi
}

function color_my_prompt {
    local __user_color="\[$(tput setaf 2)\]"
    local __dir_color="\[$(tput bold)$(tput setaf 4)\]"
    local __color_reset="\[$(tput sgr0)\]"
    local __prompt_tail_color="\[$(tput sgr0)$(tput setaf 2)\]"

    local __user="$__user_color\u"
    local __dir="$__dir_color\w"
    local __git_changes='`get_git_changes`' # do not execute right away
    local __prompt_tail="$__prompt_tail_color> "

    export PS1="$__user $__dir $__git_changes$__prompt_tail$__color_reset"
}

color_my_prompt
