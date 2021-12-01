alias ll='ls -lah'
alias l='ls'

alias gs='git status'

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
