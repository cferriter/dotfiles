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

export PATH="$PATH:/usr/local/bin/diff-highlight"
export PATH="$PATH:/usr/local/go/bin"

# VISUAL is just a full screen editor like vim or emacs.
export VISUAL=nvim
export EDITOR="$VISUAL"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Use rg to search for files with both 'fzf' and CTRL+T keybinding.
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob '!.git''
# Don't respect .gitignore with the CTRL+T keybinding.
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND --no-ignore"
# # Use Tokyo Night Moon theme.
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --highlight-line \
  --info=inline-right \
  --ansi \
  --layout=reverse \
  --border=none \
  --color=bg+:#2d3f76 \
  --color=bg:#1e2030 \
  --color=border:#589ed7 \
  --color=fg:#c8d3f5 \
  --color=gutter:#1e2030 \
  --color=header:#ff966c \
  --color=hl+:#65bcff \
  --color=hl:#65bcff \
  --color=info:#545c7e \
  --color=marker:#ff007c \
  --color=pointer:#ff007c \
  --color=prompt:#65bcff \
  --color=query:#c8d3f5:regular \
  --color=scrollbar:#589ed7 \
  --color=separator:#ff966c \
  --color=spinner:#ff007c \
"
# Show a fancy preview of the file under the cursor.
export FZF_CTRL_T_OPTS='--preview="fzf-preview.sh {}"'

# Enable fuzzy completion for perf. The default way,
# '_fzf_setup_completion proc perf', needs '**' to be typed first.
complete -F _fzf_complete_kill -o default -o bashdefault perf

# Keep automatically created lines together at the end of the file.
. "$HOME/.cargo/env"
export PATH="$PATH:/root/cian/.local/bin"
