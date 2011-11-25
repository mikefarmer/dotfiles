" load all plugins
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set number
set smartindent
set smarttab
set paste
set nocompatible
set hidden

set ignorecase  " Ignore case in search
set smartcase   " Except when the search term has an uppercase char

set hls         " Highlight Search
set matchtime=4  " ... for .4 seconds
nnoremap <silent> <F1> :noh<return><esc> " turn unhighlight when I press F1

syntax on
filetype on
filetype indent on
filetype plugin on 

set noswf
set nowrap
set spell

set ts=2 sts=2 sw=2 expandtab
command! -nargs=* Wrap set wrap linebreak nolist

" Menus, Completion

set infercase  " Try to adjust insert completions for case
set completeopt=longest,menu,menuone
"               |       |    |
"               |       |    +-- Show popup even with one match
"               |       +------- Use popup menu with completions
"               +--------------- Insert longest completion match

set wildmenu  " Enable wildmenu for completion
set wildmode=longest:full,list:full
"            |            |
"            |            +-- List matches, complete first match
"            +--------------- Complete longest prefix, use wildmenu

" Buffers, Tabs, Windows 


set hidden            " Allow changing buffers without saving
set switchbuf=usetab  " Switch to existing window when switching buffers
set splitright        " When splitting vertically, split to the right
set splitbelow        " When splitting horizontally, split below
set scrolloff=8       " Lines visible above/below cursor when scrolling
set sidescrolloff=5   " Lines visible left/right of cursor when scrolling



" Remove Beeping
set noerrorbells
set visualbell
set t_vb=


" map for changing pwd to current file's dir
map ,cd :cd %:p:h<CR>

" Quick jumping between splits
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
 
" better navigation
nnoremap j gj
nnoremap k gk


" Switch to previous buffer
nmap <silent> g<space> :b#<cr>

" Completion shortcuts
inoremap <c-n>     <c-x><c-n>
inoremap <c-f>     <c-x><c-f>
inoremap <c-space> <c-x><c-o>

" Edit a file in the same directory as current file
nmap <leader>e :e <c-r>=expand('%:h').'/'<cr>


set guifont=Menlo:h15.00
set background=dark
colorscheme solarized
let g:solarized_visibility = 'low'

" Set gp to select the last paste
" http://vim.wikia.com/wiki/Selecting_your_pasted_text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" Set the Leader
let mapleader = ","

" Lusty Explorer Settings
map <Leader>r :LustyFilesystemExplorerFromHere <Enter>
map <Leader>g :LustyBufferExplorer <Enter>
let g:LustyJugglerSuppressRubyWarning = 1

" Some Surround helpers
map <D-"> ysiw" 
map <D-'> ysiw'


" NERDTree Settings
let NERDTreeWinPos="right"
map <Leader>t :NERDTree <Enter>
map <Leader>T :NERDTree 

" NERDCommenter Settings
if has("gui_running")
  map <D-/> <plug>NERDCommenterToggle
else
  map <leader>/  <plug>NERDCommenterToggle
end

" CommandT Settings
map <Leader>f :CommandT <CR>
map <leader>F :CommandTFlush <CR> :CommandT<CR>
let g:CommandTMaxHeight=10
let g:CommandTCancelMap=['<ESC>','<C-c>'] 

" Map ,V to reload the vimrc for that file
map <silent> ,V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>


" this will give you the typical Mac OS X shift select capability
"if has("gui_macvim")
"  let macvim_hig_shift_movement = 1
"endif
"
" Auto Save on lost focus
au FocusLost * :wa


" some autocmd stuff :)
if has("autocmd")
  " automatically reload vimrc when saved.
  au bufwritepost .vimrc source $MYVIMRC
  " some trickery to aid snipmate in providing snips to appropriate files
  au BufRead,BufNewFile *.erb set filetype=eruby.html
  au BufRead,BufNewFile *.js set filetype=javascript.javascript-jquery

  " set fugitive buffers to auto delete
  autocmd BufReadPost fugitive://* set bufhidden=delete
  
endif

" some quick filetype switch mappings
nmap <leader>h :set filetype=html<cr>
nmap <leader>j :set filetype=javascript.javascript-jquery<cr>
nmap <leader>e :set filetype=eruby.html<cr>


" Reload all snipmate snippets
nmap <silent> <leader>rr :call ReloadAllSnippets()<cr>


" map for undo history
nnoremap <leader>z :GundoToggle<CR>

" Start ack with word under cursor
nmap <leader>A :Ack -a <c-r><c-w>
vmap <leader>A :<c-u>Ack -a <c-r>*

" Ignore images files in lists
:set wildignore+=*.gif,*.jpg,*.png,*.tiff,*.jpeg
