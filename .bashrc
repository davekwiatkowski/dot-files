#!/bin/bash

# If not running interactively, don't do anything
[ -z '$PS1' ] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

get_hostname() {
    export SHORTNAME=${HOSTNAME}
}

settitle() {
    h="$(dirs)"
    echo -ne "\e]2;$h\a\e]1;$h\a";
}

# Set directory colors
eval `dircolors ~/.dir_colors`

# Setup information colors
jobs_color='[0;31m'
hostname_color='[1;37m'
cwd_color='[0;34m'
input_color='[0;38m'

# Set prompt and window title
short_cwd='$(sed "s:\([^/\.]\)[^/]*/:\1/:g" <<< ${PWD/#$HOME/\~})'
PROMPT_COMMAND='settitle; get_hostname; history -a;'
export PS1="\[\e${jobs_color}\]\j \
\[\e${hostname_color}\]\u@\h:\
\[\e${cwd_color}\]${short_cwd}\
\[\e${input_color}\] "

# Aliases
alias grep='grep -n --color'
alias rl='ssh dave1@rlogin.cs.vt.edu'
alias portal='ssh dave1@portal.cs.vt.edu'
