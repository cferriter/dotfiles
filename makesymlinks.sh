#!/bin/bash
# This script creates symlinks from the home directory to any desired dotfiles
# in $DOTFILES_DIR.

# Dotfiles directory.
DOTFILES_DIR=~/dotfiles
# Old dotfiles backup directory.
OLD_DIR=~/dotfiles_old
# List of dotfiles to create symlinks to in $HOME.
files=".vimrc .tmux.conf .tigrc .gitconfig .gdbinit .bashrc .bash_profile
.bash_aliases .gitignore .inputrc"

echo "Creating $OLD_DIR for backup of any existing dotfiles in $HOME"
rm -rf $OLD_DIR
mkdir -p $OLD_DIR

cd $DOTFILES_DIR

echo "Moving any existing dotfiles in $HOME to $OLD_DIR"
for file in $files; do
	mv ~/$file $OLD_DIR > /dev/null 2>&1
	echo "Creating symlink to $file in $HOME"
	ln -s $DOTFILES_DIR/$file ~/$file
done

# Handle dotfiles that live in ~/.config/* directories separately.
mkdir -p ~/.config
mkdir -p $OLD_DIR/.config
config_dirs="htop nvim"
for config_dir in $config_dirs; do
	mv ~/.config/$config_dir $OLD_DIR/.config/$config_dir > /dev/null 2>&1
	echo "Creating symlink to $config_dir/ in $HOME/.config"
	ln -s $DOTFILES_DIR/.config/$config_dir ~/.config/$config_dir
done
