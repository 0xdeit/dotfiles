set nocompatible
set encoding=utf-8
syntax on
filetype plugin on
set background=dark
set number
set ruler
" Only highlight the line and column in the active window.
set noerrorbells
set mouse=a
set hidden
set noswapfile
set nobackup
set autoread
" Issues with backspace on insert mode
set backspace=indent,eol,start
" what in indentation
set tabstop=4 
set softtabstop=4 
set shiftwidth=4
set smartindent
" highlight n column
set colorcolumn=80
" splits
set splitright
set splitbelow
set wildmenu
set termguicolors

"
" Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'arcticicestudio/nord-vim'
call plug#end()
	" plugin config
" Default debian install is 0.3.4
let g:coc_disable_startup_warning = 1

" colorscheme
colorscheme nord
" Display signs for coc
set signcolumn=yes
" Display messages
set cmdheight=1

inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"
"


" custom mappings
nnoremap <F2> :edit ~/.config/nvim/init.vim<CR>
nnoremap <F3> :source ~/.config/nvim/init.vim<CR>
" Shortcuts based in the leader key
let mapleader = " "
	" move through splits
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
	" create splits
nnoremap <leader>sp :split<Space>
nnoremap <leader>vp :vsplit<Space>
	" std
nnoremap <leader>q :quit<CR>
nnoremap <leader>w :write<CR>
	" tabs
nnoremap <leader><TAB> :tabnext<CR>
nnoremap <leader><S-TAB> :tabprevious<CR>
nnoremap <leader>t :tabnew<Space>
