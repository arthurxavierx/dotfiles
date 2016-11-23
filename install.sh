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

# Get the dotfiles directory's absolute path
SCRIPT_DIR="$(cd "$(dirname "$0")"; pwd -P)"
DOTFILES_DIR="$(dirname "$SCRIPT_DIR")"

# Get current dir (so run this script from anywhere)
export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

declare -a FILES_TO_SYMLINK=(
	'.atom/keymap.cson'
	'.vimrc'
)

symlink_files() {
	local i=''
	local sourceFile=''
	local targetFile=''

	for i in ${FILES_TO_SYMLINK[@]}; do
		sourceFile="$DOTFILES_DIR/$i"
		targetFile="$HOME/$i"

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
	done

	unset FILES_TO_SYMLINK

	echo ""
	print_success "Done."

	# Copy binaries
	ln -fs $DOTFILES_DIR/bin $HOME/bin

	declare -a BINARIES=()

	for i in ${BINARIES[@]}; do
		echo "Changing access permissions for binary script :: ${i##*/}"
		chmod +rwx $HOME/${i##*/}
	done

	unset BINARIES
}

symlink_files
