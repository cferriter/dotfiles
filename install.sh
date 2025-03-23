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
	xsel
	## List Neovim/LazyVim specific packages.
	lua5.1
	liblua5.1-dev
	gettext
	libtool-bin
	autoconf
	cmake
	g++
	unzip
	chafa
	man-db
)
apt-get update -y
apt-get install -y "${packages[@]}"

# Rename 'bat' binary. Other tools expect 'bat'.
ln -sf /usr/bin/batcat /usr/local/bin/bat
## Install the Tokyo Night Moon bat theme.
mkdir -p "$(bat --config-dir)/themes"
cd "$(bat --config-dir)/themes"
curl -O https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/sublime/tokyonight_moon.tmTheme
bat cache --build
bat --list-themes | grep tokyo # should output "tokyonight_moon"
echo '--theme="tokyonight_moon"' >> "$(bat --config-dir)/config"
cd -

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
# Make `cargo` usable later in this script.
source $HOME/.cargo/env

cargo install fd-find

# Install Go.
wget https://go.dev/dl/go1.23.4.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.23.4.linux-amd64.tar.gz
rm -rf go1.23.4.linux-amd64.tar.gz

# Install Git Interactive Rebase Tool.
wget https://github.com/MitMaro/git-interactive-rebase-tool/releases/download/2.4.1/git-interactive-rebase-tool-2.4.1-ubuntu-22.04_amd64.deb
dpkg -i git-interactive-rebase-tool-2.4.1-ubuntu-22.04_amd64.deb
rm git-interactive-rebase-tool-2.4.1-ubuntu-22.04_amd64.deb

# Install diff-highlight.
curl -o /usr/local/bin/diff-highlight https://raw.githubusercontent.com/git/git/3dbfe2b8ae94cbdae5f3d32581aedaa5510fdc87/contrib/diff-highlight/diff-highlight
chmod +x /usr/local/bin/diff-highlight

# Install fzf.
rm -rf ~/.fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

# Install tmux.
rm -rf /tmp/tmux
git clone https://github.com/tmux/tmux.git /tmp/tmux
cd /tmp/tmux
sh autogen.sh
./configure && make -j $(nproc)
make install -j $(nproc)
cd -
rm -rf /tmp/tmux

# Install dependency for tmux-window-name plugin.
python3 -m pip install --user libtmux

# Install Tmux Plugin Manager.
rm -rf ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins
~/.tmux/plugins/tpm/bin/update_plugins all

# Install Tig.
rm -rf /tmp/tig
git clone https://github.com/jonas/tig.git /tmp/tig
cd /tmp/tig
make -j $(nproc) prefix=/usr
make install -j $(nproc) prefix=/usr
cd -
rm -rf /tmp/tig

# Install Neovim and Neovim/LazyVim dependencies.
## Install Lua and its libraries.
LUAROCKS_VERSION=3.11.1
wget -O /tmp/luarocks-${LUAROCKS_VERSION}.tar.gz https://luarocks.org/releases/luarocks-${LUAROCKS_VERSION}.tar.gz
tar zxpf /tmp/luarocks-${LUAROCKS_VERSION}.tar.gz -C /tmp
cd /tmp/luarocks-${LUAROCKS_VERSION}
./configure && make && make install
luarocks install luasocket
cd -
rm -rf /tmp/luarocks-${LUAROCKS_VERSION}.tar.gz /tmp/luarocks-${LUAROCKS_VERSION}
## Install lazygit.
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo /tmp/lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf /tmp/lazygit.tar.gz -C /tmp lazygit
install /tmp/lazygit /usr/local/bin
rm -rf /tmp/lazygit.tar.gz /tmp/lazygit
## Install tree-sitter.
cargo install tree-sitter-cli
## Install node.
curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
apt-get install -y nodejs
npm install -g neovim
## Install Python Neovim package.
python3 -m pip install --user --upgrade pynvim
## Download and install prebuilt Neovim.
curl -Lo /tmp/nvim-linux-x86_64.tar.gz https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.tar.gz
tar -xzf /tmp/nvim-linux-x86_64.tar.gz -C /usr/local
ln -sf /usr/local/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
cp -r /usr/local/nvim-linux-x86_64/share/man/* /usr/local/share/man/
mandb
rm -rf /tmp/nvim-linux-x86_64.tar.gz
