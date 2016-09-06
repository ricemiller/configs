#!/bin/bash
##This script will make you feel at home again!


##BASH##
ln -s ./bashrc ~/.bashrc
##BASH##


##ZSH##
ln -s ./zshrc ~/.zshrc
ln -s ./zshrc.local ~/.zshrc.local
ln -s ./zshrc.zni ~/.zshrc.zni
##ZSH##




##VIM##
ln -s ./vimrc ~/.vimrc

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
    git clone https://github.com/vim-scripts/taglist.vim.git ~/.vim/bundle/taglist
fi
##VIM##


##I3##
if [[ ! -d ~/.i3 ]]; then
    mkdir ~/.i3
fi
ln -s ./i3config ~/.i3/config
##I3##

##TMUX##
ln -s ./tmux.conf ~/.tmux.conf
if [[ ! -d ~/.tmuxinator ]]; then
    mkdir ~/.tmuxinator
fi
ln -s ./tmuxdef.yml ~/.tmuxinator/def.yml
##TMUX##


