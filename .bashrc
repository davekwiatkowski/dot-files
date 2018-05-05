#!/bin/bash

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

function get_hostname {
    export SHORTNAME=${HOSTNAME}
}

function user_color {
    id | grep "Admin" > /dev/null
    RETVAL=$?
    if [[ $RETVAL == 0 ]]; then
        usercolor="[0;32m";
    else
        usercolor="[0;35m";
    fi
}

function settitle() {
    u=${USERNAME}
    h="$u@${HOSTNAME}"
    echo -ne "\e]2;$h\a\e]1;$h\a";
}

# Set directory colors
eval `dircolors ~/.dir_colors`

# Set prompt and window title
user_color
cwd_color='[0;34m'
hostname_color='[1;32m'
input_color='[0;37m'
PROMPT_COMMAND='settitle; get_hostname; history -a;'
export PS1='\[\e${cwd_color}\e[3m\]\w\n\[\e${usercolor}\]\u\[\e${hostname_color}\]@\H\[\e${input_color}\]$ '

# Aliases
alias ls='ls -l --color'
alias grep='grep -n --color'
alias rl='ssh dave1@rlogin.cs.vt.edu'
alias portal='ssh dave1@portal.cs.vt.edu'
