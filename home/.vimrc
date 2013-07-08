"" Turn off compatibility with vi commands
set nocompatible

"" Syntax Hilighting
syntax enable
colorscheme dante

"" Line Numbering
set number

"" Search Options
set incsearch
set nohlsearch

"" Configure indentation
set smartindent
set tabstop=2
set expandtab
set shiftwidth=2

"" Turn off automatic backips
set nobackup
set nowritebackup

"" Make backspace work like normal
set backspace=2

"" Page up/down overlap
set scrolloff=3

"" Hilight matching brackets
set showmatch

"" Pastemode Hotkey
set pastetoggle=<F11>

"" Fast block indenting
vmap <tab> >gv
vmap <s-tab> <gv

"" Command mode line indenting
nmap <tab> I<tab><esc>
nmap <s-tab> ^i<bs><esc>

"" Statusline configuration
"" Always display statusline
set laststatus=2

set statusline=
"set statusline +=%5*%{&ff}%*      "file format
set statusline +=%4*\ %<%f%*      "relative path
set statusline +=%2*%m%*          "modified flag
set statusline +=%1*%=%4v\ %*       "column number
set statusline +=%1*%5l%*       "current line
set statusline +=%2*/%L%*         "total lines

"" Title bar
"set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)\ -\ %{v:servername}
set title
let &titlestring=expand("%:t")

function! ResetTitle()
  exec "set title t_ts='' t_fs=''"
  exec ":!echo -e '\033kTerminal\033\\'\<CR>"
endfunction

au VimLeave * silent call ResetTitle()

"------------------"
" Unusual Settings "
"------------------"

"" Cursor can free roam
"set virtualedit=all

"" Hilight characters past column 80
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.*/

"" Enter key creates new line but doesn't go to insertion mode
map <S-CR> O<Esc>
map <CR> o<Esc>

"" Fix my spelling error
abbr Wq wq

"" File type awareness
filetype on

"" Custom file extensions
au BufNewFile,BufRead *.thpl set filetype=perl
au BufNewFile,BufRead *.pde set filetype=java
