#!/bin/bash

set -e

BLUECOLOR="\033[1;34;49m%s\033[m\n"
REDCOLOR="\033[1;31;49m%s\033[m\n"
SEPARATOR="=============================================================="

TARGET_VIM="./vimrc_default"

function say()
{
  message="$@"
  if [ -t 1 ]; then
    printf $BLUECOLOR "$message"
  else
    echo "$message"
  fi
}

function complain()
{
  message="$@"
  if [ -t 1 ]; then
    printf $REDCOLOR "$message"
  else
    echo "$message"
  fi
}

function help_instructions()
{
  say "--install     Install vimrc"
  say "--uninstall   Uninstall vimrc"
}

function clean_legacy()
{
  say "Clear old vim..."
  trashVim=$(mktemp -d)
  if test -d $HOME/.vim; then
    mv $HOME/.vim $trashVim
  fi
  if test -d $HOME/.vimrc; then
    mv $HOME/.vimrc $trashVim
  fi
}

function type_of_installation()
{
  say "Please, choose:"
  say " -> [d] To default installation"
  say " -> [m] To minimal installation"
  say " -> [a] To abort this operation"
  while true; do
    read -p "Type [m], [d] or [a]: " INPUT
    case $INPUT in
      [Dd]* ) TARGET_VIM="./vimrc_default"; install_lappis_vim; break;;
      [Mm]* ) TARGET_VIM="./vimrc_minimal"; install_lappis_vim; break;;
      [Aa]* ) exit ;;
      * ) complain "Please choose an option.";;
    esac
  done
}

function install_lappis_vim()
{
  # First clean old vimrc
  clean_legacy

  cp $TARGET_VIM ~/.vimrc

	say $SEPARATOR
  say "vimrc installed into $HOME/.vimrc"
	say $SEPARATOR

  mkdir -p ~/.vim/
  rsync -vr .vim/ ~/.vim

	say $SEPARATOR
  say "Vim plugins installed into $HOME/.vim/"
	say $SEPARATOR

  if [[ `uname` == 'Darwin' ]]; then
    # MacOS
    font_dir="$HOME/Library/Fonts"
  else
    # Linux
    font_dir="$HOME/.fonts"
    mkdir -p $font_dir
  fi

  rsync -vr fonts/ "$font_dir"

  # Reset font cache on Linux
  if [[ -n `which fc-cache` ]]; then
    fc-cache -f $font_dir
  fi

	say $SEPARATOR
  say "Fonts installed into $font_dir"
	say $SEPARATOR
}

# Options
if test "$1" = '--install'; then
  type_of_installation
elif test "$1" = '--uninstall'; then
  clean_legacy
elif test "$1" = '--help'; then
  help_instructions
else
  complain "Invalid number of arguments"
  exit 1
fi
