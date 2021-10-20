#!/bin/bash
# This script creates symlinks from the home directory to any desired dotfiles
# in $DOTFILES_DIR.

# Dotfiles directory.
DOTFILES_DIR=~/dotfiles
# Old dotfiles backup directory.
OLD_DIR=~/dotfiles_old
# List of dotfiles to create symlinks to in $HOME.
files=".vimrc .tmux.conf .tigrc .gitconfig .gdbinit .bashrc .bash_profile
.bash_aliases .gitignore"

echo "Creating $OLD_DIR for backup of any existing dotfiles in $HOME"
mkdir -p $OLD_DIR

cd $DOTFILES_DIR

echo "Moving any existing dotfiles in $HOME to $OLD_DIR"
for file in $files; do
	mv ~/$file $OLD_DIR
	echo "Creating symlink to $file in $HOME"
	ln -s $DOTFILES_DIR/$file ~/$file
done

# Create htoprc symlink separately because it's special.
mv ~/.config/htop/htoprc $OLD_DIR
echo "Creating symlink to htoprc in $HOME/.config/htop/"
ln -s $DOTFILES_DIR/htoprc ~/.config/htop/htoprc
