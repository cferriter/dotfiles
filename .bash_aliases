alias ll='ls -lah'
alias l='ls'

alias gs='git status'

# Test applying $1 number of patches.
alias gta='git_test_apply'
git_test_apply() {
	git format-patch -$1 && \
	git checkout master && \
	git pull && \
	git am *.patch && \
	git reset --hard HEAD~$1 && \
	rm *.patch
}

alias d='du -csm *'

alias v='vim'
alias vd='vimdiff'

alias t='tig'
alias tw='tig --word-diff'

alias ta='tmux a -d'

alias pg='ps aux | grep -i'

alias eg='env | grep -i'

alias watch='watch -n 1 -d '

alias freq='watch "cat /proc/cpuinfo | grep MHz"'

alias rel='source ~/.bashrc; bind -f ~/.inputrc'

alias pcapsummary='tcpdump -enNtq --number -r'
alias pcapdetail='tshark -V -r'

alias makej='make -j $(nproc)'

color_script_url="https://raw.githubusercontent.com/JohnMorales/dotfiles/master/colors/24-bit-color.sh"
alias testcolor='bash <(curl -s $color_script_url)'

# Converts a string into a string of lowercase letters, digits and hyphens
# intended for use in things like URLs, package names or Git branch names.
slugify() {
	echo "$1" | iconv -c -t ascii//TRANSLIT | sed -E 's/[~^]+//g' | \
		sed -E 's/[^a-zA-Z0-9]+/-/g' | sed -E 's/^-+|-+$//g' | tr A-Z a-z
}

alias pwl='git pw series list'
alias pwls='git pw series list --submitter'

pwa() {
	## Get the name of the patch series.
	name=$(git pw series show -f csv $1 | grep Name | cut -d \" -f4)
	## Make the string friendly for use as a Git branch name.
	slug_name=$(slugify "$name")
	branch_name="pw-${slug_name}"
	# Checkout the latest master, then branch and apply the series.
	git checkout master && git pull && git checkout -b $branch_name && \
		git pw series apply $1
}

# Example usage:
# disas <binary_file> <c_function> <txt_file_name>
# disas test_program main after_opts
disas() {
	cmd="gdb $1 -batch -ex 'disassemble $2' > $3_$2.txt"
	eval $cmd
}
