# Author        : Derek Kozel <derek.kozel@gmail.com>

export PS1='\[\033[1;37m\][\[\033[0;32m\]\u\[\033[0;37m\]@\[\033[0;32m\]\h \[\033[0;36m\]\W\[\033[1;37m\]] \[\e[0m\]'

export EDITOR=/usr/bin/vim

# Maintain a merged history across all shells
export HISTFILESIZE=10000
export HISTCONTROL=ignoredups:erasedups
shopt -s histappend
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_local ]; then
    . ~/.bash_local
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

# enable homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
homeshick --quiet refresh
