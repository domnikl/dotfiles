DIR=`readlink ~/.bashrc`
DIR=`dirname "$DIR"`

export GOPATH=$HOME/Workspace/go
export PATH=$DIR/bin:$PATH:$GOPATH/bin:/usr/local/opt/go/libexec/bin
export ELIXIR_EDITOR="vim"
export ERL_AFLAGS="-kernel shell_history enabled"
export EDITOR="vim"

# aliases

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
  colorflag="--color"
else # OS X `ls`
  colorflag="-G"
fi

# List all files colorized in long format
alias ll='ls -lh'

# Always use colored output for `ls`
alias ls="command ls ${colorflag}"
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'

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
    local __user_color="\[\e[0;32m\]"
    local __dir_color="\[\e[1;34m\]"

    local __prompt_tail_color="$__user_color"
    local __color_reset="\[\e[00m\]"

    local __user="$__user_color\u"
    local __dir="$__dir_color\w"
    local __git_changes='`get_git_changes`' # do not execute right away
    local __prompt_tail="$__prompt_tail_color> "

    export PS1="$__user $__dir $__git_changes$__prompt_tail$__color_reset"
}

color_my_prompt

bind 'set completion-ignore-case on'
