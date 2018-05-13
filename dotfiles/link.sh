#!/bin/bash
# Create link for dotfiles
for i in .[!.]*
  do [ -f "$i" ]
    if [ -f ~/$i ]; then
      rm ~/$i
    fi
    ln -s "$PWD/$i" ~/$i
  done
