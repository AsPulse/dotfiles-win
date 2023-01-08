set number
set termguicolors
set relativenumber
set encoding=utf-8
set background=dark
set noswapfile
set smartindent
set autoread
set wildmenu
set ruler
set cursorline
set expandtab
set tabstop=2
set shiftwidth=2
set ignorecase
set incsearch
set wildmode=list:longest
set breakindent
set breakindentopt=shift:2,sbr
filetype on
language en

source $NVIM/neovide.vim



call plug#begin('~/.vim/plugged')

for fpath in split(globpath($NVIM, 'plugin-settings/**/*.vim'), '\n')
  exe 'source' fpath
endfor


Plug 'gpanders/editorconfig.nvim'
Plug 'rcarriga/nvim-notify'
Plug 'dstein64/vim-startuptime'
Plug 'justinmk/vim-sneak'

call plug#end()



for fpath in split(globpath($NVIM, 'command-settings/**/*.vim'), '\n')
  exe 'source' fpath
endfor

for fpath in split(globpath($NVIM, 'plugin-settings/**/*.lua'), '\n')
  exe 'source' fpath
endfor
