# If not running interactively, don't do anything.
case $- in
	*i*) ;;
	  *) return;;
esac

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

# Enable programmable completion features.
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

# VISUAL is just a full screen editor like vim or emacs.
export VISUAL=vim
export EDITOR="$VISUAL"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Use rg to search for files with both 'fzf' and CTRL+T keybinding.
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob '!.git''
# Don't respect .gitignore with the CTRL+T keybinding.
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND --no-ignore"
# Show a fancy preview of the file under the cursor.
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'" 

# Enable fuzzy completion for perf. The default way,
# '_fzf_setup_completion proc perf', needs '**' to be typed first.
complete -F _fzf_complete_kill -o default -o bashdefault perf

