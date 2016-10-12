""Pathogen load
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding with the spacebar
nnoremap <space> za

" Enable folding
set foldmethod=indent
set foldlevel=99

let g:SimpylFold_docstring_preview=1

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

"define BadWhitespace before using in a match
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/


if has('gui_running')
	set background=dark
	colorscheme solarized
else
	set t_Co=256
	colorscheme zenburn
endif

call togglebg#map("<F5>")

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
map <C-n> :NERDTreeToggle<CR>

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

set nu

set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
 
 nmap Ж :
 " yank
 nmap Н Y
 nmap з p
 nmap ф a
 nmap щ o
 nmap г u
 nmap З P

set cursorline
set backspace=indent,eol,start
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'


"python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
	project_base_dir = os.environ['VIRTUAL_ENV']
	activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
	#execfile(activate_this, dict(__file__=activate_this))
	with open(activate_this) as f:
		code = compile(f.read(), activate_this, 'exec')
		exec(code, dict(__file__=activate_this))
EOF


let g:AutoClosePairs = "() {} \" '"
set hidden


"open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>
"
" " Move to the next buffer
nmap <leader>l :bnext<CR>
"
" " Move to the previous buffer
nmap <leader>h :bprevious<CR>
"
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>
"
" " Show all open buffers and their status
nmap <leader>bl :ls<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


python3_highlight_all=1
syntax on
