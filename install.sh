#!/bin/sh

# https://github.com/nicksp/dotfiles/blob/master/setup.sh

# This symlinks all the dotfiles (and .atom/) to ~/
# It also symlinks ~/bin for easy updating

# This is safe to run multiple times and will prompt you about anything unclear

#
# Utils
#
execute() {
	$1 &> /dev/null
	print_result $? "${2:-$1}"
}

print_error() {
	# red
	printf "\e[0;31m  [✖] $1 $2\e[0m\n"
}

print_info() {
	# blue
	printf "\n\e[0;34m $1\e[0m\n"
}

print_warning() {
	# light yellow
	printf "\e[0;93m  [!] $1 \e[0m\n"
}

print_question() {
	# yellow
	printf "\e[0;33m  [?] $1 \e[0m"
}

print_result() {
	[ $1 -eq 0 ] \
		&& print_success "$2" \
		|| print_error "$2"

	[ "$3" == "true" ] && [ $1 -ne 0 ] \
		&& exit
}

print_success() {
	# green
	printf "\e[0;32m  [✔] $1\e[0m\n"
}

symlink() {
	local sourceFile="$DOTFILES/$1"
	local targetFile="$HOME/$2"

	print_info "Linking $targetFile -> $sourceFile"

	if [ ! -e "$targetFile" ]; then
		execute "ln -fs $sourceFile $targetFile" "$targetFile → $sourceFile"
	elif [ "$(readlink "$targetFile")" == "$sourceFile" ]; then
		print_success "$targetFile -> $sourceFile"
	else
		print_question "'$targetFile' already exists, do you want to overwrite it? [Y/n]"
		read yn
		case $yn in
			[Nn]* ) print_error "$targetFile → $sourceFile";;
			* )
				rm -rf "$targetFile"
				execute "ln -fs $sourceFile $targetFile" "$targetFile → $sourceFile"
				;;
		esac
	fi
}

#
# Main
#
echo "   _       _    ___  _  _"
echo " _| | ___ | |_ |  _||_|| | ___  ___"
echo "| . || . ||  _||  _|| || || -_||_ -|"
echo "|___||___||_|  |_|  |_||_||___||___|"
echo " "

# Warn user this script will overwrite current dotfiles
print_warning "Warning: this will overwrite your current dotfiles."
while true; do
	print_question "Continue? [y/N] " yn
	read yn
	case $yn in
		[Yy]* ) break;;
		* ) exit;;
	esac
done

DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export DOTFILES

git submodule update --init

# atom
symlink "atom/keymap.cson" ".atom/keymap.cson"
symlink "atom/styles.less" ".atom/styles.less"
symlink "atom/snippets.cson" ".atom/snippets.cson"

# tmux
symlink "tmux.conf" ".tmux.conf"
symlink "tmux" ".tmux"
tic ./xterm-256color-italic.terminfo
tic ./tmux-256color.terminfo

# vim
symlink "vim" ".config/nvim"
symlink "vim" ".vim"
symlink "vim/init.vim" ".vimrc"

symlink "editorconfig" ".editorconfig"
symlink "eslintrc" ".eslintrc"

# zsh
symlink "oh-my-zsh/custom" ".oh-my-zsh/custom"
symlink "profile" ".profile"
symlink "aliases" ".aliases"
symlink "zshrc" ".zshrc"

symlink "bin" ".bin"

#
echo ""
print_success "Done."
