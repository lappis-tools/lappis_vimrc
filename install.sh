#!/bin/bash

cp .vimrc ~/.vimrc

mkdir -p ~/.vim/
rsync -vr .vim/ ~/.vim
