"============================================================
" Plugins
"============================================================
set runtimepath^=~/.vim/bundle/ctrlp.vim
set runtimepath^=~/.vim/bundle/vim-airline/plugin/airline.vim
set runtimepath^=~/.vim/bundle/dracula

"============================================================
" aubinlrx settings
"============================================================
set omnifunc=syntaxcomplete#Complete
set smartindent
set t_Co=256
set termguicolors
let &t_ut=''
syntax on 
set background=dark
let g:dracula_colorterm = 0
let g:dracula_italic = 0
color dracula 
set colorcolumn=80
filetype plugin indent on
set shiftwidth=2 " number of spaces when shift indenting
set tabstop=2 " number of visual spaces per tab
set softtabstop=2 " number of spaces in tab when editing
set backspace=indent,eol,start
set expandtab " tab to spaces
set number " show line numbers
set cursorline  " highlight current line
set showmatch " highlight matching [{()}]
set incsearch " search as characters are entered
set hlsearch " highlight matches
set clipboard^=unnamed "shared clipboard with OS
let g:ctrlp_working_path_mode = 'r'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/* " lol
let g:ctrlp_show_hidden=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " autoquit if only nerdtree is open
set noswapfile
autocmd FileType javascript JsPreTmpl html
let g:jsx_ext_required = 0

" airline
let g:airline#extensions#tabline#enabled = 0 
let g:airline#extensions#branch#enabled = 1 
let g:airline_left_sep = ' ❤  '
let g:airline_right_sep = ' 🟆  '
let g:airline_section_warning = '' 
let g:airline_section_y = '' 
let g:airline_section_x = '' 
set laststatus=2 " for airline
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
" ctrl-p plugin shortcut
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" move between buffers
map <C-Left> <Esc>:bprev<CR>
map <C-Right> <Esc>:bnext<CR>

" Nerd Tree toggling
map <C-b> :NERDTreeToggle<CR>

" move lines up and down
let g:move_key_modifier = 'C'

" switch to left / right split (mostly for Nerd Tree)
map <C-h> <C-W>h
map <C-l> <C-W>l
"============================================================
" Start pathogen
"============================================================
execute pathogen#infect()
call pathogen#helptags()

set noruler
set noshowmode
set hidden

