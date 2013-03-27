:set t_Co=256
colorscheme summerfruit256
set nu
:set hlsearch
filetype plugin on
set ofu=syntaxcomplete#Complete

"ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold 

call pathogen#runtime_append_all_bundles() 
" language messages en

filetype on  " Automatically detect file types.
set nocompatible  " We don't want vi compatibility.
 
" Add recently accessed projects menu (project plugin)
set viminfo^=!
 
" Minibuffer Explorer Settings
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
 
" alt+n or alt+p to navigate between entries in QuickFix
map <silent> <m-p> :cp <cr>
map <silent> <m-n> :cn <cr>
 
" Change which file opens after executing :Rails command
let g:rails_default_file='config/database.yml'
 
syntax enable

"-------------------------
set cf  " Enable error files & error jumping.
set clipboard+=unnamed  " Yanks go on clipboard instead.
set history=256  " Number of things to remember in history.
set autowrite  " Writes on make/shell commands
set ruler  " Ruler on
set nu  " Line numbers on
set nowrap  " Line wrapping off
set timeoutlen=1000  " Time to wait after ESC (default causes an annoying delay)
" colorscheme vividchalk  " Uncomment this to set a default theme
 
" Formatting (some of these are for coding in C and C++)
set ts=2  " Tabs are 2 spaces
set bs=2  " Backspace over everything in insert mode
set shiftwidth=2  " Tabs under smart indent
set nocp incsearch
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set cindent
set autoindent
set smarttab
set expandtab
 
" Visual
set showmatch  " Show matching brackets.
set mat=5  " Bracket blinking.

" set list
" Show $ at end of line and trailing space as ~
set lcs=tab:\ \ ,eol:$,trail:~,extends:>,precedes:<

" set novisualbell  " No blinking .
" set noerrorbells  " No noise.
"set laststatus=2  " Always show status line.
 
" gvim specific
set mousehide  " Hide mouse after chars typed
set mouse=a  " Mouse in all modes
"-------------------------
"winsize 180 40
set splitright
set splitbelow
set go-=m
set go-=T

command! -nargs=1 -bang -complete=customlist,genutils#UserFileComplete2 FindInPath :find<bang> <args> 

set backupdir=~/.vim_backups,.
set directory=~/.vim_backups,.

filetype off
filetype plugin indent on

noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l
inoremap jj <ESC>

au Bufread,BufNewFile *.as set filetype=actionscript

let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" relative line numbering 
"autocmd InsertEnter * :set number
"autocmd InsertLeave * :set relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc


" Wrap or Nowrap words if it exceeds 80 characters 
function! WrapWords()
  if(&wrap == 1)
    set nowrap 
  else 
    set wrap
    set linebreak
    set nolist  " list disables linebreak
  endif
endfunc

" Run ruby script 
function! RunRuby()
  :w
  let name = input('Enter Argument (if any): ')  
  execute ':!ruby % '.name
endfunc

nnoremap <C-w> :call WrapWords()<cr>
nnoremap <C-n> :call NumberToggle()<cr>
nnoremap <C-t> :TagbarToggle<cr>
map <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
map <F6> :call RunRuby()<cr>


" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
