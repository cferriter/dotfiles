#!/bin/bash -ex

# List and install APT packages.
packages=(
	git
	curl
	htop
	wget
	build-essential
	cscope
	universal-ctags
	cgdb
	bc
	libevent-dev
	libncurses-dev
	byacc
	highlight
	automake
	pkg-config
	pip
	libtool
	ripgrep
	libpcap-dev
	libnuma-dev
	python3-sphinx
	git-email
	bat
	pipx
	tree
	fd-find
	xsel
	software-properties-common
)
apt-get update -y
apt-get install -y "${packages[@]}"

## Install a newer Vim.
add-apt-repository ppa:jonathonf/vim
apt-get update -y
apt-get install -y vim

# Rename 'bat' binary. Other tools expect 'bat'.
ln -s /usr/bin/batcat /usr/local/bin/bat

# Make symbolic links to dotfiles.
./makesymlinks.sh

# List and install Python packages.
packages=(
	meson
	ninja
	pyelftools
	scapy
	netaddr
	git-pw
)
pipx ensurepath
for package in "${packages[@]}"; do
	pipx install "$package"
done

# Install Rust.
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Install Git Interactive Rebase Tool.
wget https://github.com/MitMaro/git-interactive-rebase-tool/releases/download/2.4.1/git-interactive-rebase-tool-2.4.1-ubuntu-22.04_amd64.deb
dpkg -i git-interactive-rebase-tool-2.4.1-ubuntu-22.04_amd64.deb
rm git-interactive-rebase-tool-2.4.1-ubuntu-22.04_amd64.deb

# Install diff-highlight.
curl -o /usr/local/bin/diff-highlight https://raw.githubusercontent.com/git/git/3dbfe2b8ae94cbdae5f3d32581aedaa5510fdc87/contrib/diff-highlight/diff-highlight
chmod +x /usr/local/bin/diff-highlight

# Install tmux.
rm -fr /tmp/tmux
git clone https://github.com/tmux/tmux.git /tmp/tmux
cd /tmp/tmux
sh autogen.sh
./configure && make -j $(nproc)
make install -j $(nproc)
cd -
rm -fr /tmp/tmux

# Install Tmux Plugin Manager.
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install Tig.
rm -fr /tmp/tig
git clone https://github.com/jonas/tig.git /tmp/tig
cd /tmp/tig
make -j $(nproc) prefix=/usr
make install -j $(nproc) prefix=/usr
cd -
rm -fr /tmp/tig
