"" ================ vim-plug ================
" Attempt to install the vim-plug plugin manager.
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !mkdir -p ~/.vim/autoload/ && wget -O ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Fetch plugins from the below GitHub repos.
Plug 'tpope/vim-sensible'
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdcommenter'
Plug 'google/vim-searchindex'
Plug 'iberianpig/tig-explorer.vim'
Plug 'brookhong/cscope.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-sleuth'
Plug 'nelstrom/vim-visual-star-search'
Plug 'vimwiki/vimwiki'
Plug 'benmills/vimux'
Plug 'romainl/vim-qf'

" Use ':PlugUpdate' after making changes.
call plug#end()

"" ================ appearance ================
syntax enable
set background=dark

" Don't wrap long lines, necessitates scrolling horizontally.
set nowrap

" Use F3 to toggle the display of whitespace characters.
nnoremap <F3> :set list!<CR>
set listchars=space:.,tab:>-,trail:~,extends:>,precedes:<

" Must come after vim-plug.
colorscheme solarized

" Show a ruler at 80 characters.
set colorcolumn=80

" Use F2 to toggle word wrapping.
nnoremap <F2> :set wrap!<CR>

" Use F5 to toggle line numbers.
nnoremap <F5> :set number!<CR>

"" ================ bindings ================
" Use space as mapleader.
let mapleader=" "

" Use \ to open the last used buffer.
map \ :b#<CR>

" Scroll left and right.
nnoremap L 20zl
nnoremap H 20zh

nnoremap <c-j> :join<CR>

" Run a program (default is "man") to lookup the keyword under the cursor.
nnoremap <c-k> K

" Scroll up and down.
nmap K 3<c-y>
nmap J 3<c-e>

" Open new buffer with no name in the current window.
nnoremap <c-n> :enew<CR>

" Delete the file currently open.
nnoremap <Leader>rm :call delete(expand('%')) \| bdelete!<CR>

" Toggle paste mode.
set pastetoggle=<F4>

" Use ' to jump to exact position of mark.
map ' `

" Paste while keeping the clipboard intact.
xnoremap p pgvy

" Next and previous quickfix list results.
nnoremap <Leader>n :cn<CR>
nnoremap <Leader>N :cp<CR>

" Remove trailing whitespace.
fun! TrimWhitespace()
	let l:save = winsaveview()
	keeppatterns %s/\s\+$//e
	call winrestview(l:save)
endfun

nnoremap <Leader>w :call TrimWhitespace()<CR>

"" ================ seaching ================
" Highlight all matches.
set hlsearch

"" ================ split panes ================
set splitbelow
set splitright
" Set quickfix window height to 1/3 of Vim window height.
let &l:winheight = &lines / 3

"" ================ misc ================
set tabstop=4
" Speed up Vim startup time by disabling connection to the X server.
set clipboard=exclude:.*
" Allow modified buffers to be hidden.
set hidden

"" ================ fzf.vim ================
nnoremap ; :Buffers<CR>
nnoremap <c-p> :Files<CR>
nnoremap <Leader>r :Tags<CR>
nnoremap <Leader>R :BTags<CR>

" Use ag to search and allow hidden files to be found.
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

"" ================ ack.vim ================
" Use ag to search.
if executable('ag')
	let g:ackprg = 'ag --vimgrep'
endif

" Start project wide string search. Leave empty to search word under cursor.
nnoremap <Leader>, :Ack<Space>

" Automagically open the file with 'j' or 'k'.
let g:ackpreview = 1

"" ================ tig-explorer.vim ================
" Open tig with current file.
nnoremap <Leader>t :TigOpenCurrentFile<CR>

" Open tig blame with current file.
nnoremap <Leader>b :TigBlame<CR>

" Disable built-in terminal.
let g:tig_explorer_use_builtin_term=0

"" ================ cscope.vim ================
nnoremap <Leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
nnoremap <Leader>l :call ToggleLocationList()<CR>

" s: Find this C symbol.
nnoremap <Leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
" g: Find this definition.
nnoremap <Leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
" d: Find functions called by this function.
nnoremap <Leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
" c: Find functions calling this function.
nnoremap <Leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
" t: Find this text string.
nnoremap <Leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
" e: Find this egrep pattern.
nnoremap <Leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
" f: Find this file.
nnoremap <Leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
" i: Find files #including this file.
nnoremap <Leader>fi :call CscopeFind('i', expand('<cword>'))<CR>

"" ================ vimwiki ================
" Highlight different header levels in different colors.
let g:vimwiki_hl_headers = 1

"" ================ vimux ================
" Run the last run shell CMD in the tmux split.
nnoremap <Leader>k :w<CR>:VimuxRunCommand("!!")<CR>
