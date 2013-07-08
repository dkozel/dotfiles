# Author        : Derek Kozel <derek.kozel@gmail.com>

export PS1='\[\033[1;37m\][\[\033[0;32m\]\u\[\033[0;37m\]@\[\033[0;32m\]\h \[\033[0;36m\]\W\[\033[1;37m\]] \[\e[0m\]'
export PATH=$PATH:/opt/uClinux/bfin-uclinux/bin:/opt/uClinux/bfin-linux-uclibc/bin:/home/dkozel/Cypress/arm-2011.03/bin

export FX3_INSTALL_PATH=$HOME/Cypress/cyfx3sdk

export EDITOR=/usr/bin/vim

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi
