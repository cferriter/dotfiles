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
BLACK_TEXT="\[\033[38;5;0m\]"
BLUE_BACKGROUND="\[\033[48;5;4m\]"
RESET="\[$(tput sgr0)\]"
CURRENT_DIR="\w"
COLOURED_CURRENT_DIR="${BLACK_TEXT}${BLUE_BACKGROUND}${CURRENT_DIR}${RESET}"
DOLLAR_SYMBOL="\\$"
export PS1="${COLOURED_CURRENT_DIR}${DOLLAR_SYMBOL} ${RESET}"

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

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Use ag to search for files with both 'fzf' and CTRL+T keybinding.
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# VISUAL is just a full screen editor like vim or emacs.
export VISUAL=vim
export EDITOR="$VISUAL"
