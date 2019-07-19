Dotfiles
========
This repo should be cloned to your home repo so that the path is `~/dotfiles/`.

The `makesymlinks.sh` script creates cymlinks from your home directory to the
files which are located in `~/dotfiles/`. The script will also back up existing
dotfiles into `~/dotfiles/`.

Prerequisites
-------------
- ag must be installed for some of the Vim searching functionality.
- xclip must be installed to copy text in tmux copy mode.
- The editor to be used by git, and hence tig, must be set in the
  /etc/gitconfig file on a particular system.
- Vim8 is required for the vim-gutentags plugin.

Installation
------------
``` bash
git clone https://github.com/cferriter/dotfiles.git ~/dotfiles
cd ~/dotfiles
./makesymlinks.sh
```

Useful Links
------------
Includes some repos used as inspiration.

- [GitHub Dotfiles](https://dotfiles.github.io/):
  GitHub guide to dotfiles.
- [Dotfiles](https://github.com/michaeljsmalley/dotfiles/blob/master/makesymlinks.sh):
  Copied `makesymlinks.sh` script here.
- [Other Dotfiles](https://github.com/bndabbs/dotfiles/blob/master/.vimrc):
  Copied automatic vim-plug download logic from here.
- [Solarized Modern PuTTY Defaults](https://github.com/jblaine/solarized-and-modern-putty/blob/master/putty-modern-256color.reg):
  Copied PuTTY Windows registry (.reg) file here.
- [Bash startup files](https://shreevatsa.wordpress.com/2008/03/30/zshbash-startup-files-loading-order-bashrc-zshrc-etc/):
  Explains the loading order of Bash files.
- [Vim Awesome](https://vimawesome.com/):
  Vim plugin directory.
- [Why Vim?](http://www.terminally-incoherent.com/blog/2012/03/21/why-vim/):
  Useful article with Vim usage examples.
- [idiomatic-vimrc](https://github.com/romainl/idiomatic-vimrc.git):
  .vimrc guidelines.
- [System clipboard and Vim](https://vi.stackexchange.com/questions/84/how-can-i-copy-text-to-the-system-clipboard-from-vim):
  Explains some of the intricacies behind using the system clipboard and Vim as
  well as SSHing.
- [universal-ctags](https://github.com/universal-ctags/ctags):
  A more capable ctags implementation.

Vim Plugins
------------
[vim-plug](https://github.com/junegunn/vim-plug) is used to install and manage
the list of plugins below.

- [sensible.vim](https://github.com/tpope/vim-sensible):
  Sensible .vimrc defaults.
- [Solarized Colorscheme for Vim](https://github.com/altercation/vim-colors-solarized).
- [fzf vim](https://github.com/junegunn/fzf.vim):
  Fuzzy searching tool (mainly used for file and tag searching).
- [ack.vim](https://github.com/mileszs/ack.vim):
  Search tool which can make use of
  [ag (The Silver Searcher)](https://github.com/ggreer/the_silver_searcher).
- [vim-polyglot](https://github.com/sheerun/vim-polyglot):
  A collection of language packs for Vim.
- [NERD Commenter](https://github.com/scrooloose/nerdcommenter).
- [vim-searchindex](https://github.com/google/vim-searchindex):
  Display number of search matches.
- [tig-explorer.vim](https://github.com/iberianpig/tig-explorer.vim):
  Jump to tig diff or blame view of current file.
- [Cscove](https://github.com/brookhong/cscope.vim):
  Attempts to find proper cscope database for current file and prompts cscope
  file creation when file not found. Also provides interface to cscope
  searches.
- [Gutentags](https://github.com/ludovicchabant/vim-gutentags):
  Automatic tag file regeneration.
- [sleuth.vim](https://github.com/tpope/vim-sleuth):
  Automatic detection of indent settings.
- [Visual Star Search](https://github.com/nelstrom/vim-visual-star-search):
  Use asterisk to search for visually highlighted text.
- [Vimwiki](https://github.com/vimwiki/vimwiki):
  Linked text files with custom syntax highlighting.
- [vimux](https://github.com/benmills/vimux):
  Interact with tmux from vim shortcuts (mainly used for repeating the previous
  command in a tmux pane split with the current pane).
