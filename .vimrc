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

" Use ':PlugUpdate' after making changes.
call plug#end()

"" ================ appearance ================
syntax enable
set background=dark
" Use F3 to toggle the display of whitespace characters.
nnoremap <F3> :set list!<CR>
set listchars=tab:>-,trail:~,extends:>,precedes:<

" Must come after vim-plug.
colorscheme solarized

" Use F2 to toggle a ruler at 80 characters, shown by default.
set colorcolumn=80
nnoremap <F2> :let &cc = &cc == '' ? '80' : ''<CR>

"" ================ bindings ================
" Use space as mapleader.
let mapleader=" "

" Use \ to open the last used buffer.
map \ :b#<CR>

"" ================ seaching ================
" Highlight all matches.
set hlsearch

"" ================ split panes ================
set splitbelow
set splitright

"" ================ misc ================
set tabstop=4
" Allow yanking to the system clipboard. See link below for more info.
" https://vi.stackexchange.com/questions/84/how-can-i-copy-text-to-the-system-clipboard-from-vim
set clipboard=unnamed
" Allow modified buffers to be hidden.
set hidden

"" ================ fzf.vim ================
nnoremap ; :Buffers<CR>
nnoremap <c-p> :Files<CR>
nnoremap <Leader>r :Tags<CR>

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

"" ================ cscope.vim ================
nnoremap <Leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
nnoremap <Leader>l :call ToggleLocationList()<CR>

" s: Find this C symbol.
nnoremap  <Leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
" g: Find this definition.
nnoremap  <Leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
" d: Find functions called by this function.
nnoremap  <Leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
" c: Find functions calling this function.
nnoremap  <Leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
" t: Find this text string.
nnoremap  <Leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
" e: Find this egrep pattern.
nnoremap  <Leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
" f: Find this file.
nnoremap  <Leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
" i: Find files #including this file.
nnoremap  <Leader>fi :call CscopeFind('i', expand('<cword>'))<CR>
