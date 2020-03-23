set nocompatible " Make vim more usefull

" ================ Plug ==============================

if filereadable(expand("~/.vimrc.plug"))
  source ~/.vimrc.plug
endif

"============================================================
" aubinlrx settings
"============================================================

" Enable 256 colors in terminal
syntax enable
set t_Co=256
set termguicolors
let &t_ut=''
set omnifunc=syntaxcomplete#Complete

" Colorscheme
set background=dark
let g:dracula_colorterm = 0
let g:dracula_italic = 0
color dracula

" Auto-index
filetype indent off
filetype plugin on
set autoindent
set smartindent

" Indent with 4 spaces, use soft-tabs
set tabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start

" 2 spaces for ruby/web
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype eruby setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype vue setlocal ts=2 sts=2 sw=2
autocmd Filetype vuejs setlocal ts=2 sts=2 sw=2
autocmd Filetype css setlocal ts=2 sts=2 sw=2
autocmd Filetype scss setlocal ts=2 sts=2 sw=2
autocmd Filetype sh setlocal ts=2 sts=2 sw=2
autocmd Filetype coffee setlocal ts=2 sts=2 sw=2

" Set colorcolumn for column beyond 80
set colorcolumn=81
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Show line number
set number relativenumber
set nu rnu

" Highlight current line
set cursorline

" Improve performance
set lazyredraw

" Highlight matching [{()}]
set showmatch

" Hide unsave file instead of close
set hidden

" Search as characters are entered
set incsearch

" Highlight matches
set hlsearch

" Shared clipboard with OS
set clipboard^=unnamed

" Remove trailing whitespaces
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

set noswapfile
autocmd FileType javascript JsPreTmpl
autocmd FileType javascript.jsx JsPreTmpl
let g:jsx_ext_required = 0

" ------------------------------------------------------------------------------
" ctrlp: https://github.com/ctrlpvim/ctrlp.vim
" File finder with <ctrl> + p
"-------------------------------------------------------------------------------
let g:ctrlp_show_hidden = 1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.DS_Store|\.git|node_modules|coverage|obj|tmp|public)$',
  \ 'file': '\v\.(o)$',
  \ }

" NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " autoquit if only nerdtre/ is open
let NERDTreeShowHidden=1
map <C-b> :NERDTreeToggle<CR>

" Airline
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline_left_sep = ' ❤  '
let g:airline_right_sep = ' 🟆  '
let g:airline_section_warning = ''
let g:airline_section_y = ''
let g:airline_section_x = ''
set laststatus=2 " for airline

" -----------------------------------------------------------------------------
" vim-grepper: https://github.com/mhinz/vim-grepper
" Search occurences of current word with <leader> + j
" ------------------------------------------------------------------------------

" Search word under cursor using rg
nnoremap <leader>j :Grepper -tool rg -cword -noprompt<cr>
let g:grepper = {}
" Use location list for the matches instead of quickfix
let g:grepper.quickfix = 0
" Auto-close Location-List on CR
:autocmd FileType qf nmap <buffer> <cr> <cr>:lcl<cr>
" Add command for Rg
command! -nargs=+ -complete=file Rg Grepper -noprompt -tool ag -query <args>
command! -nargs=+ -complete=file Fi Grepper -noprompt -tool git -query <args>

"============================================================
" Mappings
"============================================================
" Make `jj` and `jk` throw you into normal mode
inoremap jj <esc>
inoremap jk <esc>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" move between buffers
map <C-Left> <Esc>:bprev<CR>
map <C-Right> <Esc>:bnext<CR>

" move lines up and down
let g:move_key_modifier = 'C'

" switch to left / right split (mostly for Nerd Tree)
map <C-h> <C-W>h
map <C-l> <C-W>l
