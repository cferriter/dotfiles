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
Includes links to the vim plugins that I use. Also includes some repos used as inspiration.

- [GitHub Dotfiles](https://dotfiles.github.io/): GitHub guide to dotfiles.
- [Dotfiles](https://github.com/michaeljsmalley/dotfiles.git): Copied the `makesymlinks.sh` script.
- [Vim Awesome](https://vimawesome.com/): Vim plugin directory.
- [Why Vim?](http://www.terminally-incoherent.com/blog/2012/03/21/why-vim/): Useful article with vim usage examples.
- [idiomatic-vimrc](https://github.com/romainl/idiomatic-vimrc.git): .vimrc guidelines.
- [vim-plug](https://github.com/junegunn/vim-plug): Vim plugin manager.
- [ack.vim](https://github.com/mileszs/ack.vim): Search tool which can make use of [ag (The Silver Searcher)](https://github.com/ggreer/the_silver_searcher).
- [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim): Fuzzy file search.

