#!/bin/bash

set -e

BLUECOLOR="\033[1;34;49m%s\033[m\n"
REDCOLOR="\033[1;31;49m%s\033[m\n"

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

function clean_legacy()
{
  say "Clear old vim..."
  trashVim=$(mktemp -d)
  mv $HOME/.vim $trashVim
  mv $HOME/.vimrc $trashVim
}

# First clean old vimrc
clean_legacy

cp .vimrc ~/.vimrc

say "vimrc installed into $HOME/.vimrc"

mkdir -p ~/.vim/
rsync -vr .vim/ ~/.vim

say "Vim plugins installed into $HOME/.vim/"

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

say "Fonts installed into $font_dir"
