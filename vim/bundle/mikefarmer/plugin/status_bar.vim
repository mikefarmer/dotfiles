set statusline=%f%m%r%h%w\ POS=%l,%v\ of\ %L\ %y
" This will add the Syntax Item to the status line. Use this for building a theme
 "function! SyntaxItem()
   "return synIDattr(synID(line("."),col("."),1),"name")
 "endfunction

"set statusline+=%{SyntaxItem()}



"Put the RVM Info in the Status Line
"function! RvmStatusLine()
    "if ! exists('g:rvm_prompt')
        "let g:rvm_prompt = system("~/.rvm/bin/rvm-prompt v g")
        "let g:rvm_prompt = substitute(g:rvm_prompt, '\n', '', 'g')
    "endif
    "return '['.g:rvm_prompt.']'
"endfunction




set statusline+=%{fugitive#statusline()}
"set statusline+=\ %{RvmStatusLine()}
set laststatus=2

