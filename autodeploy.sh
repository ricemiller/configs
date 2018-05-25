#!/bin/bash
##This script will make you feel at home again!

DIR=$(dirname "$(readlink -f "$0")")

##BASH##
ln -sf $DIR/bashrc ~/.bashrc
##BASH##


##ZSH##
ln -sf $DIR/zshrc ~/.zshrc
ln -sf $DIR/zshrc.local ~/.zshrc.local
ln -sf $DIR/zshrc.zni ~/.zshrc.zni
##ZSH##




##VIM##
ln -sf $DIR/vimrc ~/.vimrc

if [[ ! -d ~/.vim ]]; then

    ##Installing Pathogen
    mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

    git clone git://github.com/jiangmiao/auto-pairs.git ~/.vim/bundle/auto-pairs
    git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
    git clone https://github.com/ervandew/supertab.git ~/.vim/bundle/supertab
    git clone https://github.com/tomtom/tlib_vim.git ~/.vim/bundle/tlib_vim
    git clone https://github.com/MarcWeber/vim-addon-mw-utils.git ~/.vim/bundle/vim-addon-mw-utils
    git clone https://github.com/garbas/vim-snipmate.git ~/.vim/bundle/vim-snipmate
    git clone https://github.com/honza/vim-snippets.git ~/.vim/bundle/vim-snippets
    git clone https://github.com/scrooloose/syntastic.git ~/.vim/bundle/syntastic
    git clone https://github.com/mbbill/undotree.git ~/.vim/bundle/undotree
fi
##VIM##


##I3##
if [[ ! -d ~/.i3 ]]; then
    mkdir ~/.i3
fi
ln -sf $DIR/i3config ~/.i3/config
##I3##

##TMUX##
ln -sf $DIR/tmux.conf ~/.tmux.conf
if [[ ! -d ~/.tmuxinator ]]; then
    mkdir ~/.tmuxinator
fi
ln -sf $DIR/tmuxdef.yml ~/.tmuxinator/def.yml
##TMUX##


