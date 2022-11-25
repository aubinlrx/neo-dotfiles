set nocompatible " Make vim more usefull

" ================ Plug ==============================
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif

" Run :PlugInstall to install new Plugins
call plug#begin()
" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Status bar
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Git integration
Plug 'tpope/vim-fugitive' " :G git command
Plug 'junegunn/gv.vim' " :GV git visual
Plug 'airblade/vim-gitgutter'
" Status bar
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
" Nerdtree
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
" Search
Plug 'mhinz/vim-grepper' " :Grepper search globally in project
Plug 'google/vim-searchindex' " display common search result
" Linters
Plug 'dense-analysis/ale'
" Colorscheme
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
" Diplay tab with vertical lines
Plug 'Yggdroot/indentLine'
" Manage surround char
Plug 'tpope/vim-surround'
" Run async command
Plug 'skywind3000/asyncrun.vim'
" Synthax
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
" " -- Vue
Plug 'posva/vim-vue'
" -- Svelte
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'codechips/coc-svelte', {'do': 'npm install'}
" -- Rust
Plug 'rust-lang/rust.vim'
" -- Coffee
Plug 'kchmck/vim-coffee-script'
" -- EJS / JST
Plug 'briancollins/vim-jst'
" -- Terraform HCL
Plug 'hashivim/vim-terraform'
" -- Prettier
Plug 'mhartington/formatter.nvim'
" -- Jsx
Plug 'neoclide/vim-jsx-improve'
Plug 'Quramy/vim-js-pretty-template'
" -- JS
Plug 'isRuslan/vim-es6'
" -- Markdown
Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
" Comppletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" treesitter enable
if (has("nvim"))
lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed ={ "javascript", "json", "css", "html", "python", "bash", "regex", "ruby", "yaml", "jsonc", "tsx", "lua", "vue", "rust", "go" },
  highlight = {
    enable = true,
    disable = { "php" },  -- list of language that will be disabled
  },
  indent = {
    enable = false
  },
}
EOF
endif

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
let g:vim_json_conceal = 0

" Update time
set updatetime=300

" Colorscheme
set background=dark
let $BAT_THEME='tokyo-night'
color tokyonight

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

" set jbuilder as ruby
au BufRead,BufNewFile *.json.jbuilder set filetype=ruby

" 2 spaces for ruby/web
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype eruby setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype vue setlocal ts=2 sts=2 sw=2
autocmd Filetype vuejs setlocal ts=2 sts=2 sw=2
autocmd Filetype svelte setlocal ts=2 sts=2 sw=2
autocmd Filetype css setlocal ts=2 sts=2 sw=2
autocmd Filetype scss setlocal ts=2 sts=2 sw=2
autocmd Filetype sh setlocal ts=2 sts=2 sw=2
autocmd Filetype coffee setlocal ts=2 sts=2 sw=2
autocmd Filetype ejs setlocal ts=2 sts=2 sw=2
autocmd Filetype jst setlocal ts=2 sts=2 sw=2
autocmd Filetype json.jbuilder setlocal ts=2 sts=2 sw=2

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
set shell=/opt/homebrew/bin/zsh

" Fzf
let g:fzf_files_options = '--keep-right'
map <leader>pf :Files<CR>
map <leader>pb :Buffers<CR>

" Launch search
nnoremap <leader>s :Rg<Space>

" Repeat last command
nnoremap <leader><leader> @:

" NvimTree
nnoremap <leader>pt :NvimTreeFindFile<CR>
nnoremap <leader>pr :NvimTreeRefresh<CR>
nnoremap <leader>pq :NvimTreeClose<CR>

" Lightline
let g:lightline = {
      \ 'colorscheme': 'tokyonight',
      \ }

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \ }

let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ]] }

set noshowmode
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

if (has('nvim'))
lua <<EOF
require('formatter').setup({
    logging = false,
    filetype = {
        vue = {
            -- prettier
            function()
                return {
                    exe = "prettier",
                    args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
                    stdin = true
                }
            end
        },
        svelte = {
            -- prettier
            function()
                return {
                    exe = "prettier",
                    args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
                    stdin = true
                }
            end
        },
        javascript = {
            -- prettier
            function()
              return {
                exe = "prettier",
                args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
                stdin = true
              }
            end
        },
        go = {
            -- gofmt
            function()
                return {
                    exe = "gofmt",
                    args = { vim.api.nvim_buf_get_name(0)},
                    stdin = true
                }
            end
        },
        rust = {
          -- Rustfmt
          function()
            return {
              exe = "rustfmt",
              args = {"--emit=stdout"},
              stdin = true
            }
          end
        },
    }
})

require('nvim-tree').setup({
  disable_netrw   = false,
  hijack_netrw    = false,
})

vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.vue,*.svelte,*.rs,*.go FormatWrite
augroup END
]], true)
EOF
endif

" Yank highlighting
augroup highlight_yank
     autocmd!
     au TextYankPost * silent! lua vim.highlight.on_yank{timeout=250}
 augroup END

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

" OpenDir
function! OpenDir(...)
    if a:0 != 0
        let workingdir = getcwd()
        let directory = l:workingdir . '/' . a:1
    else
        let directory = expand('%:p:h')
    endif

    execute '!open ' . l:directory
    redraw
endfunction
command! -complete=file_in_path -nargs=? OpenDir call OpenDir(<f-args>)

" FilenameCopy
function! FilenameCopy()
    let filename = expand("%")
    let line = line('.')
    let fullname = l:filename . ':' . l:line

    let @@ = l:fullname
    let @* = l:fullname
    let @+ = l:fullname
    redraw

    echom 'Filename path: `' . l:fullname . '` copied!'
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
    let @+ = res
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

" Solargraph
let g:coc_global_extensions = ['coc-solargraph']

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Get directory from file
function GetDirectory(filename)
    return join(split(a:filename, '/')[0:-2], '/')
endfunction

" Rename file
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('Rename: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        let directory = GetDirectory(new_name)
        call mkdir(directory, "p")

        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>r :call RenameFile()<cr>

" Edif file with directory creation
function! EditFile(file_name)
    if a:file_name != ''
        let directory = GetDirectory(a:file_name)
        call mkdir(directory, "p")

        exec ':e ' . a:file_name
        exec ':w'
        redraw!
    endif
endfunction

" Edit file with directory creation
function! EditFileFromCurrent()
    let current_file = expand('%')
    let current_directory = join(split(current_file, '/')[0:-2], '/') . '/'
    let file_name = input('Create: ', current_directory, 'file')

    return EditFile(l:file_name)
endfunction
map <Leader>e :call EditFileFromCurrent()<cr>

" Is current file a spec
function! InSpecFile()
    return match(expand('%'), "_spec.rb$") != -1
endfunction

" Build Spec filename
function! SpecFilename()
    let ext = expand('%:e')

    if l:ext != 'rb'
        return ''
    endif

    if InSpecFile()
        return expand('%')
    endif

    let filename_wo_ext = expand('%:r')
    if l:filename_wo_ext =~? '^app\/.*'
        return substitute(l:filename_wo_ext, 'app/', 'spec/', '') . '_spec.rb'
    elseif l:filename_wo_ext =~? '^scripts\/.*'
        return 'spec/' . filename_wo_ext . '_spec.rb'
    else
        return ''
    endif
endfunction

" Determine Spec File
function! SpecFile()
    let spec = SpecFilename()

    if filereadable(l:spec)
        return l:spec
    else
        return ''
    endif
endfunction

" Determine File from Spec
function! FileFromSpec()
    let ext = expand('%:e')

    if l:ext != 'rb'
        return ''
    endif

    if !InSpecFile()
        return ''
    endif

    let file = expand('%')
    if l:file =~? '^spec\/.*'
        let file = substitute(l:file, 'spec/', 'app/', '')
        echom l:file
        let file = substitute(l:file, '_spec.rb', '.rb', '')
    else
        return ''
    endif

    if filereadable(l:file)
        return l:file
    else
        return ''
    endif
endfunction

" Open spec file
function! OpenSpec()
    if expand('%:e') != 'rb'
        echom expand('%') . ' is not a ruby file.'
        return
    endif

    let spec = SpecFile()

    if l:spec == ''
        echom "Can't open spec file for " . expand('%')
    else
        exec ':e ' . l:spec
    endif
endfunction
command! -nargs=0 OpenSpec call OpenSpec()

" Edit spec file
function! EditSpec()
    if expand('%:e') != 'rb'
        echom expand('%') . ' is not a ruby file.'
    endif

    let filename = SpecFilename()

    if filereadable(l:filename)
        return OpenSpec()
    else
        return EditFile(l:filename)
    endif
endfunction
command! -nargs=0 EditSpec call EditSpec()

" Open file from spec
function! OpenFile()
    if expand('%:e') != 'rb'
        echom expand('%') . ' is not a ruby file.'
        return
    endif

    let file = FileFromSpec()

    if l:file == ''
        echom "Can't open file from spec " . expand('%')
    else
        exec ':e ' . l:file
    endif
endfunction
command! -nargs=0 OpenFile call OpenFile()

" Run spec
function! Rspec()
    if expand('%:e') != 'rb'
        echom expand('%') . ' is not a ruby file.'
        return
    endif

    let spec = SpecFile()

    if l:spec == ''
        echom "Can't determine spec for " . expand('%')
    else
       exec ':AsyncRun! /Applications/Alacritty.app/Contents/MacOS/alacritty --hold --working-directory $(pwd) -e bundle exec spring rspec ' . l:spec
    endif
endfunction
command! -nargs=0 Rspec call Rspec()

" Run spec for specific line
function! Lspec()
    let file = expand('%')
    if l:file !~ '.*_spec.rb'
        echom expand('%') . ' is not a ruby spec file.'
        return
    endif

    let spec = SpecFile()
    let line = line('.')

    if l:spec == ''
        echom "Can't determine spec for " . expand('%')
    else
       exec ':AsyncRun! /Applications/Alacritty.app/Contents/MacOS/alacritty --hold --working-directory $(pwd) -e bundle exec spring rspec ' . l:spec . ':' . l:line
    endif
endfunction
command! -nargs=0 Lspec call Lspec()

" Run feature spec
function! Fspec()
    if expand('%:e') != 'rb'
        echom expand('%') . ' is not a ruby spec file.'
        return
    endif

    let spec = SpecFile()

    if l:spec == ''
        echom "Can't determine spec for " . expand('%')
        return
    elseif l:spec =~? '^spec\/features\/.*'
        exec ':AsyncRun! SEED=disabled DRIVER=chrome RSPEC_RETRY_RETRY_COUNT=0 bundlex exec spring rspec ' . l:spec
    else
        echom l:spec . ' is not a features spec'
    endif
endfunction
command! -nargs=0 Fspec call Fspec()

" Print full path
map <C-f> :echo expand("%:p")<cr>set nocompatible " Make vim more usefull
