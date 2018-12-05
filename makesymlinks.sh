#!/bin/bash
############################
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles.
############################

# Dotfiles directory.
dir=~/dotfiles
# Old dotfiles backup directory.
olddir=~/dotfiles_old
# List of files/folders to symlink in $HOME.
files=".vimrc .tmux.conf .tigrc .gitconfig"

# Create dotfiles_old in $HOME.
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# Change to the dotfiles directory.
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# Move any existing dotfiles in $HOME to dotfiles_old directory.
# Create symlinks from the $HOME to any files in the ~/dotfiles directory specified in $files.
for file in $files; do
	echo "Moving any existing dotfiles from ~ to $olddir"
	mv ~/$file ~/dotfiles_old/
	echo "Creating symlink to $file in home directory."
	ln -s $dir/$file ~/$file
done
