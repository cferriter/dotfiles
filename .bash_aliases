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

alias v='nvim'
alias vd='nvim -d'

alias t='tig'

alias ta='tmux attach -d'

alias pg='ps aux | head -1; ps aux | grep -i'
alias ptg='ps -eLf | head -1; ps -eLf | grep -i'

alias eg='env | grep -i'
alias ag='alias | grep -i'
alias gg='git alias | grep -i'

alias watch='watch -n 0.1 -d '

alias freq='watch "cat /proc/cpuinfo | grep MHz"'

alias rel='source ~/.bashrc; bind -f ~/.inputrc'

alias pcapsummary='tcpdump -enNtq --number -r'
alias pcapdetail='tshark -V -o ip.check_checksum:TRUE -o udp.check_checksum:TRUE -r'

alias makej='make -j $(nproc)'

color_script_url="https://raw.githubusercontent.com/JohnMorales/dotfiles/master/colors/24-bit-color.sh"
alias testcolor='bash <(curl -s $color_script_url)'

hl() {
	tput smso; $@; tput sgr0;
}

err() {
	tput setaf 1; $@; tput sgr0;
}

log() {
	hl echo ">>>>>>>>>>>>>>>>>>>>>>|$@"
}

log_err() {
	err echo ">>>>>>>>>>>>>>>>>>>>>>|$@"
}

log_beg() {
	hl echo "vvvvvvvvvvvvvvvvvvvvvv|$@"
}

log_end() {
	hl echo "^^^^^^^^^^^^^^^^^^^^^^|$@"
}

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

alias dcd='docker compose down'
alias dstop='docker stop $(docker ps -a -q) > /dev/null 2>&1'
alias drm='docker system prune -a --volumes'

alias lsnics='lshw -class network -businfo'

webserver() {
	python3 -m http.server 8080 > /dev/null 2>&1 &
	echo "Webserver link: http://$(hostname).ir.intel.com:8080/"
}
