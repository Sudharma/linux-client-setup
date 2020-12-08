#!/bin/bash

git clone https://github.com/lifepillar/vim-solarized8.git    ~/.vim/pack/themes/opt/solarized8
mkdir -p ~/.vim/colors
cp ~/.vim/pack/themes/opt/solarized8/colors/solarized8* ~/.vim/colors/

cat << EOF >> ~/.vimrc
syntax enable
color solarized8_high
set number
set autoindent
set hlsearch
set showcmd
set mouse=a

# This is needed for maintaining same color with tmux
set background=dark
set t_Co=256

# Needed for display cursor in edit/insert mode
autocmd InsertEnter,InsertLeave * set cul!
EOF

