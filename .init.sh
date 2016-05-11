#!/usr/bin/sh

if [`which git`]; then
  mkdir ~/.vim/bundle
  cd ~/.vim/bundle && git clone https://github.com/Shougo/neobundle.vim.git
fi

cd && ln -s .vim/.vimrc]
