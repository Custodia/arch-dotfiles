#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

## Set bash prompt
# Dir shortening function
dir_chomp () {
  pwd 2> /dev/null | sed -e "s|^$HOME|~|" -e 's:\(\.\?[^/]\)[^/]*/:\1/:g'
}

# Git branch parsing function
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[\033[32m\]\$(dir_chomp)\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

# Functions only useful on the laptop
if [[ $(hostname -s) = serendipity ]]; then
    battery () {
        acpi -b
    }
fi
