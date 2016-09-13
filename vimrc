set nocompatible
" Always make sure you are running in 256 color mode
set t_Co=256
set encoding=utf-8
runtime macros/matchit.vim

call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdcommenter'
Plug 'mileszs/ack.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'bling/vim-airline'
Plug 'kchmck/vim-coffee-script'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'slim-template/vim-slim'
Plug 'chase/vim-ansible-yaml'
Plug 'mustache/vim-mustache-handlebars'
Plug 'elixir-lang/vim-elixir'
Plug 'mxw/vim-jsx'
Plug 'fatih/vim-go'
Plug 'ngmy/vim-rubocop'
Plug 'ntpeters/vim-better-whitespace'
Plug 'isRuslan/vim-es6'
call plug#end()

syntax on
filetype plugin indent on

set number
set autoindent
set smartindent
set smarttab
set hidden

set colorcolumn=100

set ignorecase  " Ignore case in search
set smartcase   " Except when the search term has an uppercase char

set hlsearch         " Highlight Search
"set matchtime=4  " ... for .4 seconds
set incsearch " move to that search while typing

set noswf
set nowrap
set spell

set ts=2 sts=2 sw=2 expandtab
"command! -nargs=* Wrap set wrap linebreak nolist
"
"" Menus, Completion
"
"set infercase  " Try to adjust insert completions for case
set completeopt=longest,menu  ",menuone
""               |       |    |
""               |       |    +-- Show popup even with one match
""               |       +------- Use popup menu with completions
""               +--------------- Insert longest completion match
"
set wildmenu  " Enable wildmenu for completion
set wildmode=longest:full,list:full
""            |            |
""            |            +-- List matches, complete first match
""            +--------------- Complete longest prefix, use wildmenu
"
"" Buffers, Tabs, Windows
set complete=.,w,b,t


"set switchbuf=usetab  " Switch to existing window when switching buffers
set splitright        " When splitting vertically, split to the right
set splitbelow        " When splitting horizontally, split below
set scrolloff=8       " Lines visible above/below cursor when scrolling
set sidescrolloff=5   " Lines visible left/right of cursor when scrolling
set laststatus=2
set diffopt=filler,vertical

" Remove Beeping
set noerrorbells
set visualbell
set t_vb=

" Faster switching between modes
set timeoutlen=1000 ttimeoutlen=0

" Because I always type Wa instead of wa
command! Wa :wa

" Set the Leader
let mapleader = ","

" map for changing pwd to current file's dir
map <leader>cd :cd %:p:h<CR>

" Quick jumping between splits
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"better splits
nmap <silent> vv :vsp<CR>
nmap <silent> ss :sp<CR>

" better tab navigation
nmap <silent> [g :tabprevious<CR>
nmap <silent> ]g :tabnext<CR>
nmap <silent> [G :tabrewind<CR>
nmap <silent> ]G :tablast<CR>
nmap <silent> tt :tabnew<CR>

" F-keys
nnoremap <silent> <c-F1> :tabfirst<CR>
nnoremap <silent> <c-F2> :tabnext 2<CR>
nnoremap <silent> <c-F3> :tabnext 3<CR>
nnoremap <silent> <c-F4> :tabnext 4<CR>
nnoremap <silent> <c-F5> :tabnext 5<CR>
nnoremap <silent> <c-F6> :tabnext 6<CR>
nnoremap <silent> <c-F7> :tabnext 7<CR>
nnoremap <silent> <c-F8> :tabnext 8<CR>
nnoremap <silent> <c-F9> :tabnext 9<CR>
nnoremap <silent> <c-F10> :tabnext 10<CR>


" better navigation
nnoremap j gj
nnoremap k gk


" RENAME CURRENT FILE
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

" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>
imap <c-k> <space>->

" Can't be bothered to understand ESC vs <c-c> in insert mode
imap <c-c> <esc>
" Clear the search buffer when hitting return
function! MapCR()
  nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
au FileType ruby inoremap <tab> <c-r>=InsertTabWrapper()<cr>
au FileType ruby inoremap <s-tab> <c-n>


" better backspace
" make backspace work from anywhere
set backspace=indent,eol,start
" make backspace work in normal mode as expected
nmap <bs> i<bs>

" Switch to previous buffer
nmap <silent> g<space> :b#<cr>

" Completion shortcuts
inoremap <c-n>     <c-x><c-n>
inoremap <c-f>     <c-x><c-f>
inoremap <c-space> <c-x><c-o>


set nospell
set guifont=Inconsolata-dz\ for\ Powerline:h13.00
set background=dark
colorscheme solarized

" Set gp to select the last paste
" http://vim.wikia.com/wiki/Selecting_your_pasted_text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'


" Edit a file in the same directory as current file
nmap <leader>ee :e <c-r>=expand('%:h').'/'<cr>

" close the window
map <leader>w :q<cr>

"some gui specific settings
if has("gui_running")
  " Auto Save on lost focus
  au FocusLost * :wa

endif


" NERDTree Settings
let NERDTreeWinPos="right"
let g:NERDTreeDirArrows=1
let g:NERDTreeWinSize = 50
map <Leader>t :NERDTreeFind <Enter>
map <Leader>T :NERDTreeToggle <Enter>

" NERDCommenter Settings
map <c-\> <plug>NERDCommenterToggle

" Fugitive Shortcut for Gstatus
map <leader>s :Gstatus<cr>

" CtrlP Mappings
map <leader>f :CtrlP<cr>
map <leader>b :CtrlPBuffer<cr>
" put the result at the top
let g:ctrlp_match_window_reversed = 0
" Use only the current working directory
let g:ctrlp_working_path_mode = ''


" Only autoclose quotes
map  <leader>" :AutoCloseQuotesOnly<cr>
map  <leader>"" :AutoCloseOff<cr>

" Airline settings
let g:airline_powerline_fonts = 1

" Map ,V to reload the vimrc for that file
map <silent> ,V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" some autocmd stuff :)
if has("autocmd")
  au BufRead,BufNewFile *.erb set filetype=eruby.html
  au BufRead,BufNewFile *.js set filetype=javascript
  au BufRead,BufNewFile Gemfile set filetype=ruby
  au BufRead,BufNewFile Capfile set filetype=ruby
  au BufRead,BufNewFile Guardfile set filetype=ruby
  au BufRead,BufNewFile *.coffee nmap <leader>c :CoffeeCompile<cr>
  au BufRead,BufNewFile *.md set background=light
  au BufRead,BufNewFile *.md set wrap linebreak nolist
  au BufRead,BufNewFile *.slimbars set filetype=slim
  au BufRead,BufNewFile *.emblem set filetype=slim

  " set fugitive buffers to auto delete
  autocmd BufReadPost fugitive://* set bufhidden=delete

  autocmd BufWritePre * StripWhitespace

endif


" Start ack with word under cursor
nmap <leader>A :Ack <c-r><c-w>
vmap <leader>A :<c-u>Ack <c-r>*
au FileType ruby nmap <leader>A :Ack --ruby <c-r><c-w>
au FileType ruby vmap <leader>A :<c-u>Ack --ruby <c-r>*

" Ignore images files in lists
set wildignore+=*.gif,*.jpg,*.png,*.tiff,*.jpeg,tmp/**,coverage/**

" Setup ctags for the project
au FileType ruby nmap <silent> <Leader>rt :!bundle list --paths=true \| xargs ctags --extra=+f --exclude=.git --exclude=log -R *<CR><CR>


" Some aliases for things I commonly type
au FileType ruby abbr rla Rails.logger.ap
au FileType ruby abbr rli Rails.logger.info
au FileType ruby abbr rld Rails.logger.debug
au FileType javascript abbr clg console.log
au FileType markdown abbr hl [](http://)<ESC>T[i

" Syntastic settings
let g:syntastic_html_tidy_exec = "/usr/local/bin/tidy"
let g:syntastic_html_tidy_ignore_errors = [ 'trimming empty <i>']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_ruby_checkers = ['rubocop', 'mri']
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:syntastic_always_populate_loc_list = 1
let g:SOURCEGRAPH_AUTO = "false"

" Go settings
au FileType go nmap <silent> <leader>r :wa<cr> <Plug>(go-run)
au FileType go nmap <silent> <leader>b :wa<cr> <Plug>(go-build)
au FileType go nmap <leader>g <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>gi <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gr <Plug>(go-rename)
au FileType go imap <tab> <C-x><C-o>
au FileType go nnoremap <F2> :GRAPH<CR>
au FileType go set ts=4 sts=4 sw=4 expandtab
