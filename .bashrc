# If not running interactively, don't do anything.
case $- in
	*i*) ;;
	  *) return;;
esac

# See "man bash" for explanations to some of these settings.
# Remove previous lines matching the current line.
HISTCONTROL=erasedups

# Append to the history file, don't overwrite it.
shopt -s histappend

HISTSIZE=5000
HISTFILESIZE=10000

# Check the window size after each command and update LINES and COLUMNS.
shopt -s checkwinsize

# Configure prompt.
FGBLACK='\e[0;30m';
BGWHITE="\e[47m"
ENDCOLOR="\e[0m"
export PS1="$FGBLACK$BGWHITE\w$ENDCOLOR\$ "

# Enable color support of ls and also add handy aliases.
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'

	alias grep='grep --color=auto'
fi

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# Environment specific settings should go in bash_local.
if [ -f ~/.bash_local ]; then
	. ~/.bash_local
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export VISUAL=vim
export EDITOR="$VISUAL"
