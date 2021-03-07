call plug#begin('~/.local/share/nvim/plugged')

Plug 'wakatime/vim-wakatime'
Plug 'junegunn/fzf.vim'
"=== Plug 'romgrk/doom-one.vim'
Plug 'chiefnoah/neuron-v2.vim'
Plug 'rakr/vim-one'

call plug#end()

colorscheme one
set background=dark " for the dark version
" set background=light " for the light version

" Misc settings
set number relativenumber " Show line numbers
set ruler " Show line and column numbers of the cursor.
set termguicolors
set tabstop=8
set expandtab
set shiftwidth=4
set autoindent
set smartindent
set smartcase
syntax on

" leader key
let mapleader="\<space>"



