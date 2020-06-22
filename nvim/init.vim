" Gallo's VIM/NeoVIM config v.0.0.3

" general-config
" Do not try to use vi compatible things
set nocompatible

" Display where we are in the current file
" set ruler

" Enable mouse support
set mouse=a

" avoid sound warnings
set noerrorbells

" tab-stuff
" tab should be 4 characters
set tabstop=4 
set softtabstop=4
set shiftwidth=4

" change tabs to spaces 
set expandtab

" auto indent
set smartindent

" Always show n lines while scrolling vertically
set scrolloff=5

" Show at least 5 characters while scrolling off screen horizontally
set sidescrolloff=5

" Basic syntax highlighting
syntax enable
filetype plugin on

" Leader key <SPACE>
let mapleader=" "

" Colorscheme from the defaults
" colorscheme murphy

" Show the current line number
set number

" Show relative line number
" set relativenumber

" Allow y/p from system clipboard
set clipboard+=unnamedplus

" Highlight current line
 set cursorline

" Incremental search
set incsearch

" dont highlight results of search
set nohlsearch

" remove the highlighting once its finished
" nnoremap <Leader>s :nohlsearch<CR>

" Do not close buffers, hide them
set hidden

" Do not make tmp files in working directory, 
set noswapfile

" only create undofiles in the specified undodir
set nobackup
set undodir=~/.config/nvim/undodir
set undofile

" from <How to Do 90% of What Plugins Do (With Just Vim)> [https://www.youtube.com/watch?v=XA2WjJbmmoM]

" Finding files
" Search into subfolders
" Provides tab-completion for file-related commands
set path+=**

" Ignore certain files or folders
set wildignore+=**/node_modules/**

" display all matching files when tab complete
set wildmenu

" vim-plug-section
call plug#begin('~/.config/nvim/plugged')
" Comment/Uncomment
" gc comment line
Plug 'tpope/vim-commentary'
" Using vim for databases
Plug 'tpope/vim-dadbod'
" Conquer Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" kewl Status line
Plug 'itchyny/lightline.vim'
" undos
" TODO: Configuration and mappings
Plug 'mbbill/undotree'
" Git integration
" TODO: Configuration and mappings
Plug 'tpope/vim-fugitive'
" fzf, don't need hook
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
" nvim theme
" Archived theme: Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'morhetz/gruvbox'
call plug#end()

" theme-config
" Show pretty colors heh
if has('nvim') || has('termguicolors')
    set termguicolors
endif

" Archived theme
"colorscheme challenger_deep
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
set background=dark

" plugin-config-section
" Plugin: lightline
" Use lightline to show modes, not (n)vim
set noshowmode
let g:lightline = {'colorscheme': 'gruvbox'}

" Plugin: fzf
" ripgrep
if executable('rg')
    let g:rg_derive_root='true'
endif

" Plugin: netrw
let g:netrw_browse_split=2
let g:vrfr_rg='true'
let g:netrw_banner=0
let g:netwr_winsize=25

" Plugin: Conquer of Completion
" Get extra line in the bottom for displaying messages
set cmdheight=2
" update quicker
set updatetime=50
" do not pass messages to |ins-completion-menu|.
set shortmess+=c
" coc-vimlsp
let g:markdown_fenced_languages = ['vim', 'help']
" symbols
set signcolumn=yes

" map-section
" move through windows/splits?
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" undotree
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>U :UndotreeHide<CR>

" file explorer
nnoremap <leader>f :wincmd v<bar> :Ex <bar> :vertical resize 30 <CR>

" fzf explorer 
nnoremap <leader>F :Files <CR>
nnoremap <leader>gf :GFiles<CR>

" coc 
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gt <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart

" fugitive 
nmap <leader>gs :G<CR>

