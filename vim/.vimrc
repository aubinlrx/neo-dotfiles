set nocompatible " Make vim more usefull

" ================ Plug ==============================
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif

" Run :PlugInstall to install new Plugins
call plug#begin()
" Status bar
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Git integration
Plug 'tpope/vim-fugitive' " :G git command
" Plug 'junegunn/gv.vim' " :GV git visual
Plug 'airblade/vim-gitgutter'
" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Nerdtree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Search
Plug 'mhinz/vim-grepper' " :Grepper search globally in project
Plug 'google/vim-searchindex' " display common search result
" Linters
Plug 'dense-analysis/ale'
" Colorscheme
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox'
" Diplay tab with vertical lines
Plug 'Yggdroot/indentLine'
" Manage surround char
Plug 'tpope/vim-surround'
" Synthax
" -- All
Plug 'sheerun/vim-polyglot'
" -- Go
Plug 'fatih/vim-go'
" -- Vue
Plug 'posva/vim-vue'
" -- Jsx
Plug 'neoclide/vim-jsx-improve'
Plug 'Quramy/vim-js-pretty-template'
" -- JS
Plug 'isRuslan/vim-es6'
" -- Markdown
Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'
" Comppletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

"============================================================
" aubinlrx settings
"============================================================

" Open file at line number
function! OpenToLine(opened_file)
    let filename = split(a:opened_file, ':')

    if len(filename) == 1
        let editCommand = 'edit ' . l:filename[0]
    else
        let editCommand = 'edit +' . l:filename[1] . ' ' . l:filename[0]
    endif

    execute editCommand
endfunction

" Close empty buffers
function! CleanEmptyBuffers()
    let buffers = filter(range(1, bufnr('$')), 'buflisted(v:val) && empty(bufname(v:val)) && bufwinnr(v:val)<0 && !getbufvar(v:val, "&mod")')
    if !empty(buffers)
        exe 'bw ' . join(buffers, ' ')
    endif
endfunction

" Map leader to space
let mapleader=" "

" Enable 256 colors in terminal
syntax enable
set t_Co=256
set termguicolors
let &t_ut=''
set omnifunc=syntaxcomplete#Complete
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" Update time
set updatetime=300

" Colorscheme
set background=dark
let g:dracula_colorterm = 0
let g:dracula_italic = 0
color dracula "gruvbox

" Auto-index
filetype indent off
filetype plugin on
set autoindent
set smartindent

" Open in new tab
set switchbuf+=usetab,newtab

" Indent with 4 spaces, use soft-tabs
set tabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start

"Custom Filetype
autocmd BufNewFile,BufRead *.ejs set filetype=ejs
autocmd BufNewFile,BufRead *._ejs set filetype=ejs

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
autocmd Filetype ejs setlocal ts=2 sts=2 sw=2

" Set colorcolumn for column beyond 80
set colorcolumn=81
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Show line number
set number "relativenumber

" Highlight current line
"set cursorline

" Improve performance
set lazyredraw
set ttyfast

" Highlight matching [{()}]
set noshowmatch

" We show the mode with airline or lightline
set noshowmode

" Search case insensitive...
set ignorecase
" ... but not it begins with upper case
set smartcase

set nocursorcolumn           " speed up syntax highlighting
set nocursorline
set updatetime=300

" Hide unsave file instead of close
set hidden

" Search as characters are entered
set incsearch

" Highlight matches
set hlsearch

" Shared clipboard with OS
set clipboard^=unnamed
set clipboard^=unnamedplus

" increase max memory to show syntax highlighting for large files
set maxmempattern=20000

" Remove trailing whitespaces
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" JS template string literal
autocmd FileType javascript JsPreTmpl
autocmd FileType javascript.jsx JsPreTmpl

" Don't use .swp
set noswapfile

" Use zsh
set shell=/usr/local/bin/zsh

" Fzf
map <leader>pf :Files<CR>
map <leader>pb :Buffers<CR>

" Launch search
nnoremap <leader>s :Rg<Space>

" Repeat last command
nnoremap <leader><leader> @:

" NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " autoquit if only nerdtre/ is open
let NERDTreeShowHidden=1
map <leader>pt :NERDTreeToggle<CR>

" Airline
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline_left_sep = ' ❤ '
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
" Search visual selection using rg
vnoremap <leader>j y:Rg <c-r>"<cr>

let g:grepper = {}
" Use location list for the matches instead of quickfix
let g:grepper.quickfix = 0
" Auto-close Location-List on CR
:autocmd FileType qf nmap <buffer> <cr> <cr>:lcl<cr>
" Add command for Rg
" command! -nargs=+ -complete=file Rg Grepper -noprompt -tool rg -query <args>
command! -nargs=+ -complete=file Fi Grepper -noprompt -tool rg -query <args>

" Open file at line number
command! -nargs=1 -complete=file Open call OpenToLine(<f-args>)
command! -nargs=1 -complete=file O call OpenToLine(<f-args>)
nnoremap <leader>po :Open<Space>


"============================================================
" Mappings
"============================================================
" Make `jj` and `jk` throw you into normal mode
inoremap jj <esc>
inoremap jk <esc>

" Move between panes
nnoremap <leader>wv <C-w>v
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l
nnoremap <leader>wh <C-w>h

" move between buffers
map <leader>fh <Esc>:bprev<CR>
map <leader>fl <Esc>:bnext<CR>

" Close all buffer
map <leader>bq <Esc>:bufdo bd<CR>

" List all buffers with fzf
map <leader>bf :Buffers<CR>

" YAMLNav
function! s:yaml_nav_command()
    let filename = expand('%:p')
    return "yaml-path list " . filename . " -l"
endfunction

function! s:yaml_nav_line_handler(line)
    let filename = expand('%:p')
    let res = split(a:line, "#")
    let line = l:res[1]

    execute ":" . l:line
endfunction

function! s:yaml_nav_format_line(lines)
    echom a:lines[0]
    return "test"
    " return a:lines
endfunction

command! YAMLNav call fzf#run({
\   'source': <sid>yaml_nav_command(),
\   'sink': function('<sid>yaml_nav_line_handler'),
\   'reduce': function('<sid>yaml_nav_format_line'),
\   'down': '30%',
\})

nnoremap <leader>yf <Esc>:YAMLNav<CR>

" FilenameCopy
function! FilenameCopy()
    let filename = expand("%")
    let line = line('.')

    let @@ = l:filename
    let @* = l:filename
    redraw

    echom 'Filename path: `' . l:filename . ':' . l:line . '` copied!'
endfunction
command! -nargs=0 FilenameCopy call FilenameCopy()
nnoremap <leader>fy <ESC>:FilenameCopy<CR>

" YAMLCopy
function! YamlCopy()
    let initial_col = col('.')
    let col = l:initial_col

    execute 'normal! ^'
    let start_col = col(".")
    if col < start_col
        let col = l:start_col
    endif
    execute 'normal! ' . l:initial_col . '|'

    let line = line('.')
    let filename = expand('%:p')
    let res = systemlist('yaml-path get ' . l:filename . ' -c ' . l:col . ' -l ' . l:line)[0]

    let @@ = res
    let @* = res
    redraw

    echom 'Yaml path: `' . l:res . '` copied! ('.l:line.':'.l:col.')'
endfunction

command! -nargs=0 YAMLCopy call YamlCopy()
nnoremap <leader>yy <ESC>:YAMLCopy<CR>

" Close empty buffer
command! -nargs=0 BClean call CleanEmptyBuffers()
map <leader>bc :BClean<CR>

" move lines up and down
let g:move_key_modifier = 'C'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" switch to left / right split (mostly for Nerd Tree)
map <C-h> <C-W>h
map <C-l> <C-W>l

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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

" Rename file
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

" Print full path
map <C-f> :echo expand("%:p")<cr>
