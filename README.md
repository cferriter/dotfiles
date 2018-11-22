Dotfiles
========
This repo should be cloned to your home repo so that the path is `~/dotfiles/`.

The `makesymlinks.sh` script creates cymlinks from your home directory to the
files which are located in `~/dotfiles/`. The script will also back up existing
dotfiles into `~/dotfiles/`.

Installation
------------

``` bash
git clone https://github.com/cferriter/dotfiles.git ~/dotfiles
cd ~/dotfiles
./makesymlinks.sh
```

Useful Links
------------
Includes links to the Vim plugins that I use. Also includes some repos used as inspiration.

- [GitHub Dotfiles](https://dotfiles.github.io/): GitHub guide to dotfiles.
- [Dotfiles](https://github.com/michaeljsmalley/dotfiles.git): Copied the `makesymlinks.sh` script here.
- [Solarized Modern PuTTY Defaults](https://github.com/jblaine/solarized-and-modern-putty/blob/master/putty-modern-256color.reg): Coped the Windows registry (.reg) file here.
- [Vim Awesome](https://vimawesome.com/): Vim plugin directory.
- [Why Vim?](http://www.terminally-incoherent.com/blog/2012/03/21/why-vim/): Useful article with Vim usage examples.
- [idiomatic-vimrc](https://github.com/romainl/idiomatic-vimrc.git): .vimrc guidelines.

Vim Plugins
------------
The Vim plugin manager I use is [vim-plug](https://github.com/junegunn/vim-plug).

- [ack.vim](https://github.com/mileszs/ack.vim): Search tool which can make use of [ag (The Silver Searcher)](https://github.com/ggreer/the_silver_searcher).
- [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim): Fuzzy file search.
- [vim-sensible]('https://github.com/tpope/vim-sensible'): Sensible .vimrc defaults.
- [vim-polyglot]('https://github.com/sheerun/vim-polyglot'): A collection of language packs for Vim.
- [NERD Commenter]('https://github.com/scrooloose/nerdcommenter').
- [Solarized Colorscheme for Vim]('https://github.com/altercation/vim-colors-solarized').
