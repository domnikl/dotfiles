DIR=`readlink ~/.bashrc`
DIR=`dirname "$DIR"`
export PATH=$DIR/bin:$PATH
export ELIXIR_EDITOR="atom"

function color_my_prompt {
    local __user_and_host="\[\033[00;32m\]\u@\h"
    local __cur_location="\[\033[01;34m\]\W"
    local __git_branch_color="\[\033[01;33m\]"
    #local __git_branch="\`ruby -e \"print (%x{git branch 2> /dev/null}.grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`"
    local __git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
    local __prompt_tail="\[\033[0;36m\]❯"
    local __last_color="\[\033[00m\]"
    export PS1="$__user_and_host $__cur_location $__git_branch_color$__git_branch$__prompt_tail$__last_color "
}

color_my_prompt

bind 'set completion-ignore-case on'

eval "$(direnv hook bash)"
