#!/bin/sh

if ! [ -d autoload ]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

cd && ln -ivs .vim/.vimrc
