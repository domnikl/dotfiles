DIR=`readlink ~/.bashrc`
DIR=`dirname "$DIR"`
export PATH=$DIR/bin:$PATH
export ELIXIR_EDITOR="atom"
export ERL_AFLAGS="-kernel shell_history enabled"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi
# aliases

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
  colorflag="--color"
else # OS X `ls`
  colorflag="-G"
fi

# List all files colorized in long format
alias ll='ls -lh'

# Always use color output for `ls`
alias ls="command ls ${colorflag}"
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'

function get_git_changes {
    local __branch=`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\\\\\\1\\/`
    local __changed_files=`git diff --name-only HEAD 2> /dev/null | wc -l | sed -E s/[^0-9]//g`

    if [ ! -z "$__branch" ] && (( "$__changed_files" > 0 )); then
        echo "($__branch ⚡️ $__changed_files)"
    elif [ ! -z "$__branch" ]; then
        echo "($__branch ☀️ )"
    else
      echo ""
    fi
}

function color_my_prompt {
    local __user_and_host="\[\033[00;32m\]\u@\h"
    local __cur_location="\[\033[01;34m\]\W"
    local __git_branch_color="\[\033[01;33m\]"
    local __git_changes='`get_git_changes`'
    local __prompt_tail="\[\033[0;36m\]❯"
    local __last_color="\[\033[00m\]"
    export PS1="$__user_and_host $__cur_location $__git_branch_color$__git_changes$__prompt_tail$__last_color "
}

color_my_prompt

bind 'set completion-ignore-case on'

eval "$(direnv hook bash)"
