#!/bin/bash

set -e

BLUECOLOR="\033[1;34;49m%s\033[m\n"
REDCOLOR="\033[1;31;49m%s\033[m\n"
SEPARATOR="=============================================================="

TARGET_VIM="./vimrc_default"

# Print normal message (e.g info messages). This function verifies if stdout
# is open and print it with color, otherwise print it without color.
# @param $@ it receives text message to be printed.
function say()
{
  message="$@"
  if [ -t 1 ]; then
    printf $BLUECOLOR "$message"
  else
    echo "$message"
  fi
}

# Print error message. This function verifies if stdout is open and print it
# with color, otherwise print it without color.
# @param $@ it receives text message to be printed.
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

# If you already have installed a vim configuration, it is a good idea to
# remove every kind of configuration file before installing lappis_vimrc.
function clean_legacy()
{
  say "Removing old vimrc..."
  local trashVim=$(mktemp -d)

  # .vim directory usually have plugins related to vim.
  if test -d $HOME/.vim; then
    mv $HOME/.vim $trashVim
  fi

  # .vimrc it is the file with vim configuration, let's move it.
  if test -f $HOME/.vimrc; then
    mv $HOME/.vimrc $trashVim
  fi
}

# Here we centralize the choose options for installing lappis_vimrc.
function type_of_installation()
{
  say "Please, choose:"
  say " -> [d] To default installation"
  say " -> [m] To minimal installation"
  say " -> [a] To abort this operation"
  # say " -> [i] Interactive installation."
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

# Synchronize .vim and .vimrc with repository.
function synchronize_vim_files()
{
  say $SEPARATOR
  say "vimrc installed into $HOME/.vimrc"
  say $SEPARATOR

  cp $TARGET_VIM ~/.vimrc

  mkdir -p ~/.vim/
  rsync -vr .vim/ ~/.vim

  say $SEPARATOR
  say "Vim plugins installed into $HOME/.vim/"
  say $SEPARATOR
}

# We just verify if it is a MacOS system or GNU/Linux.
function install_font()
{
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

function install_lappis_vim()
{
  # First clean old vimrc
  clean_legacy
  # Synchronize of vimfiles
  synchronize_vim_files
  # Copy Hack font to the correct place
  install_font
}

# ============================================================================
#                                   Options
# ============================================================================
# Options
case $1 in
  --install)
    type_of_installation;;
  --uninstall)
    clean_legacy;;
  --help)
    help_instructions;;
  *)
    complain "Invalid number of arguments"
    exit 1;;
esac
