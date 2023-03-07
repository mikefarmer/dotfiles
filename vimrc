set nocompatible
" Always make sure you are running in 256 color mode
set t_Co=256
set encoding=utf-8
runtime macros/matchit.vim

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'ervandew/supertab'
Plug 'vim-ruby/vim-ruby'
Plug 'bling/vim-airline'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'fatih/vim-go'
Plug 'ngmy/vim-rubocop'
Plug 'ntpeters/vim-better-whitespace'
" Plug 'mikefarmer/vim-autoclose'
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'jelera/vim-javascript-syntax'
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
call plug#end()

syntax on
filetype plugin indent on

" facepalm because iTerm2 sends the wrong keys
nnoremap <silent> <ESC>OA <UP>
nnoremap <silent> <ESC>OB <DOWN>
nnoremap <silent> <ESC>OC <RIGHT>
nnoremap <silent> <ESC>OD <LEFT>
inoremap <silent> <ESC>OA <UP>
inoremap <silent> <ESC>OB <DOWN>
inoremap <silent> <ESC>OC <RIGHT>
inoremap <silent> <ESC>OD <LEFT>

set number
set autoindent
set smartindent
set smarttab
set hidden
set colorcolumn=100
set ignorecase  " Ignore case in search
set smartcase   " Except when the search term has an uppercase char
set hlsearch         " Highlight Search
set matchtime=4  " ... for .4 seconds
set incsearch " move to that search while typing
set noswf
set nowrap
set nospell
set ts=2 sts=2 sw=2 expandtab

"command! -nargs=* Wrap set wrap linebreak nolist

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


" better backspace
" make backspace work from anywhere
set backspace=indent,eol,start
" make backspace work in normal mode as expected
nmap <bs> i<bs>

" Switch to previous buffer
nmap <silent> g<space> :b#<cr>

" Completion shortcuts
inoremap <c-n> <c-x><c-n>
inoremap <c-f> <c-x><c-f>
inoremap <c-o> <c-x><c-o>

" set guifont=Inconsolata-dz\ for\ Powerline:h13.00
set guifont=Victor\ Mono
set background=dark
colorscheme tomorrow-night

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
let g:NERDSpaceDelims = 1

" Fugitive Shortcut for Gstatus
map <leader>s :Git<cr>

" Airline settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_section_z = airline#section#create(["\uE0A1 " . '%{line(".")}' . ":" . '%{col(".")}'])


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
  au BufRead,BufNewFile *.md setlocal textwidth=100
  au BufRead,BufNewFile *.slimbars set filetype=slim
  au BufRead,BufNewFile *.emblem set filetype=slim

  " set fugitive buffers to auto delete
  autocmd BufReadPost fugitive://* set bufhidden=delete

  autocmd BufWritePre * StripWhitespace

endif


" Start ack with word under cursor
nmap <leader>A :Ack! <c-r><c-w>
vmap <leader>A :<c-u>Ack! <c-r>*
au FileType ruby nmap <leader>A :Ack! --ruby <c-r><c-w>
au FileType ruby vmap <leader>A :<c-u>Ack! --ruby <c-r>*

" Ignore images files in lists
set wildignore+=*.gif,*.jpg,*.png,*.tiff,*.jpeg,tmp/**,coverage/**

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~20%' }
" let g:fzf_tags_command = 'ctags -R'

nmap <silent><leader>f :Files<CR>
nmap <silent><leader>F :FZF!<CR>
nmap <silent><leader>b :Buffers<CR>
nmap <silent><leader>bb :History<CR>
nmap <silent>ff :Lines<CR>

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Some aliases for things I commonly type
au FileType ruby abbr rla Rails.logger.ap
au FileType ruby abbr rli Rails.logger.info
au FileType ruby abbr rld Rails.logger.debug
au FileType javascript abbr clg console.log
au FileType javascript abbr asf async () => {<CR>}<ESC>O
au FileType markdown abbr hl [](http://)<ESC>T[i

" quickly run rspec
au FileType ruby nmap <leader>g :wa\|:silent !echo "bin/rspec %" > test-commands<cr>:redraw!<cr>
au FileType ruby nmap <leader>G :w\|:silent !echo "bin/rspec spec --fail-fast" > test-commands<cr>:redraw!<cr>
au FileType ruby nmap <leader>i :wa\|:silent !echo "bundle exec rspec %" > test-commands<cr>:redraw!<cr>
au FileType ruby nmap <leader>h :wa\|:silent !echo "bin/rails runner %" > test-commands<cr>:redraw!<cr>

"test-commands<cr>:redraw!<cr>MUComplete settings
" let g:mucomplete#enable_auto_at_startup = 1
" inoremap <expr> <c-e> mucomplete#popup_exit("\<c-e>")
" inoremap <expr> <c-y> mucomplete#popup_exit("\<c-y>")
" inoremap <expr>  <cr> mucomplete#popup_exit("\<cr>")
" set shortmess+=c   " Shut off completion messages
" set belloff+=ctrlg " If Vim beeps during completion

" one or the other
" set completeopt+=noinsert

" Go settings
let g:go_auto_type_info = 1
let g:go_fmt_command = "goimports"
set updatetime=100
au FileType go nmap <silent> <leader>G :wa<cr> <Plug>(go-run)
au FileType go nmap <silent> <leader>B :wa<cr> <Plug>(go-build)
" au FileType go nmap <leader>r <Plug>(go-test)
" au FileType go nmap <leader>c <Plug>(go-coverage)
" au FileType go nmap <Leader>d <Plug>(go-def)
" au FileType go nmap <Leader>ds <Plug>(go-def-split)
" au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
" au FileType go nmap <Leader>dt <Plug>(go-def-tab)
" au FileType go nmap <Leader>gd <Plug>(go-doc)
" au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
" au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
" au FileType go nmap <Leader>gi <Plug>(go-implements)
" au FileType go nmap <Leader>i <Plug>(go-info)
" au FileType go nmap <Leader>gr <Plug>(go-rename)
" au FileType go set ts=4 sts=4 sw=4 expandtab
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" ALE settings
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'tslint', 'eslint'],
\   'javascriptreact': ['prettier', 'eslint'],
\   'json': ['prettier', 'eslint'],
\   'ruby': ['prettier', 'rubocop'],
\   'haml': ['prettier'],
\   'yml': ['prettier'],
\}

let g:ale_linters = {
\   'ruby': ['prettier', 'rubocop'],
\   'haml': ['prettier'],
\   'typescript': ['tslint', 'eslint'],
\   'go': ['gopls'],
\}

" Fix files automatically on save
let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_set_highlights = 0
" let g:ale_set_loclist = 0
" let g:ale_set_quickfix = 1
" let g:ale_open_list = 1
" let g:ale_keep_list_window_open = 1
" Use shortcuts for navigating errors
nmap <silent> [e <Plug>(ale_previous_wrap)
nmap <silent> ]e <Plug>(ale_next_wrap)
