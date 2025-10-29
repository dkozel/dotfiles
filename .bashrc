# Author        : Derek Kozel <derek.kozel@gmail.com>

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

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

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

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

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable git completion
if [ -f "$HOME/.git-completion.bash" ]; then
    . "$HOME/.git-completion.bash"
fi

# enable hub completion
if [ -f "$HOME/.hub.bash_completion.sh" ]; then
    . "$HOME/.hub.bash_completion.sh"
fi

# enable rbenv if installed
if [ -d ~/.rbenv/bin ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi

# Setup use of git bare repo in ~/.dotfiles to manage dotfiles
alias config="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
