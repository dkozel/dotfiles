# Author        : Derek Kozel <derek.kozel@gmail.com>

# [username@hostname directory]
export PS1='\[\033[1;37m\][\[\033[0;32m\]\u\[\033[0;37m\]@\[\033[0;32m\]\h \[\033[0;36m\]\W\[\033[1;37m\]] \[\e[0m\]'

# Set the GNOME Title to be the present working directory
PROMPT_COMMAND='echo -ne "\033]0;${PWD}\007"'

export EDITOR=/usr/bin/vim

# Maintain a merged history across all shells
HISTSIZE=5000
HISTFILESIZE=-1
HISTCONTROL=ignoredups:erasedups
shopt -s histappend
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

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

# enable git completion
if [ -f ~/.git-completion.bash ]; then
    source "$HOME/.git-completion.bash"
fi

# enable rbenv if installed
if [ -d ~/.rbenv/bin ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi
