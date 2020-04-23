syntax on

set number relativenumber
set clipboard+=unnamedplus

set nohlsearch
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir="C:\Users\Gallo\AppData\Local\nvim\undodir"
set undofile
set incsearch

" Font configuration
set guifont=Iosevka:h14

" Allow changing buffers without saving files.
set hidden

" Search in all the folder / project
set path+=**

" Completion in status bar for commands
set wildmenu

" Ignore any node_modules
set wildignore+=**/node_modules/**

" coc config 
set cmdheight=2
set updatetime=300
set signcolumn=yes

" Python paths
let g:python_host_prog = 'C:\Python27\python.exe'
let g:python3_host_prog = 'C:\Python38\python.exe'

" Lightline plugin colorscheme
let g:lightline = { 'colorscheme': 'challenger_deep' }

call plug#begin()
" Basic & sensible configurations
Plug 'tpope/vim-sensible'
" Colorscheme
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
" Status line plugin
Plug 'itchyny/lightline.vim'
" Syntax highlighting
Plug 'sheerun/vim-polyglot'
" Code completion
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
call plug#end()

" Colorscheme options
if has('nvim') || has('termguicolors')
	set termguicolors
endif

colorscheme challenger_deep

set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

" Use Tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.')[col - 1] =~# '\s'
endfunction

" Use <C-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

let mapleader = " "

let g:netrw_browse_split = 2
let g:vrfr_rg = 'true'
let g:netrw_banner = 0
let g:netrw_winsize = 25

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>pf :GFiles<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>ee oif (err != nil) {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <leader>vwm :colorscheme gruvbox<bar>:set background=dark<CR>
vnoremap X "_d

