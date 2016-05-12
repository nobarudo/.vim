#!/bin/sh

  mkdir ~/.vim/bundle
  cd ~/.vim/bundle && git clone https://github.com/Shougo/neobundle.vim.git

cd && ln -s .vim/.vimrc
