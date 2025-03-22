# Dotfiles

## Installation
``` bash
git clone https://github.com/cferriter/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

Existing dotfiles are backed up in `~/dotfiles_old/`.

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
