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

function settitle() {
    u=${USERNAME}
    h="$u@${HOSTNAME}"
    echo -ne "\e]2;$h\a\e]1;$h\a";
}

# Set directory colors
eval `dircolors ~/.dir_colors`

# Set prompt and window title
jobs_color="[0;32m"
hostname_color="[1;34m"
cwd_color="[0;36m"
input_color="[0;37m"
PROMPT_COMMAND="settitle; get_hostname; history -a;"
export PS1="\[\e${jobs_color}\]\j \
\[\e${hostname_color}\]\u@\H:\
\[\e${cwd_color}\e[3m\]\w\
\[\e${input_color}\] "

# Aliases
alias ls="ls -l --color"
alias grep="grep -n --color"
alias rl="ssh dave1@rlogin.cs.vt.edu"
alias portal="ssh dave1@portal.cs.vt.edu"
