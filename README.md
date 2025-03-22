# Dotfiles

## Installation
``` bash
git clone https://github.com/cferriter/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

Existing dotfiles are backed up in `~/dotfiles_old/`.

## Useful Links
Includes some repos used as inspiration.

- [GitHub Dotfiles](https://dotfiles.github.io/):
  GitHub guide to dotfiles.
- [Dotfiles](https://github.com/michaeljsmalley/dotfiles/blob/master/makesymlinks.sh):
  Copied `makesymlinks.sh` script from here.
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
- [SSH keys and Pageant with Windows 10](https://talesfromthedatacenter.com/2019/12/how-to-automatically-load-pagent-keys-when-windows-10-boots/):
  Explains how to use Pageant for SSH key authentication when using SSH to
  access remote servers.

## Test installation of dotfiles
`install.sh` can be tested using Docker. Build and run with:
``` bash
docker build -t dotfiles-test . && docker run -it dotfiles-test
```

## Download and install Xming X Server for Windows
- Download from [here](https://sourceforge.net/projects/xming/).
- Press `Windows`, type `xming`, right click and `Open file location`.
- Create a shortcut for the `Xming` binary.
- Open the Windows startup folder by pressing `Windows` + `R` and typing
  `shell:common startup`.
- Place the `Xming` shortcut in the Windows startup folder.

## Install and configure Kanata for Windows
- Download the latest `kanata_gui.exe` from [kanata releases](https://github.com/jtroo/kanata/releases).
- Move the binary to `C:\Users\cferrite\AppData\Roaming\kanata\kanata_gui.exe`.
- `git clone` this repo to WSL `/root`.
- Run `create_win_symlinks.sh` to symlink `kanata.kbd` to the same location as
  `kanata_gui.exe`.
- Open the Windows startup folder by pressing `Windows` + `R` and typing
  `shell:common startup`.
- Create a shortcut for `kanata_gui.exe` in the Windows File Explorer and put
  it in the Windows startup folder.
