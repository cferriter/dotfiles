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

" Use ':PlugUpdate' after making changes.
call plug#end()

"" ================ appearance ================
syntax enable
set background=dark
" Must come after vim-plug.
colorscheme solarized

"" ================ bindings ================
" Use space as mapleader.
let mapleader=" "

"" ================ seaching ================
" Highlight all matches.
set hlsearch

"" ================ split panes ================
set splitbelow
set splitright


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

" Use <\> + <,> to start string search
nnoremap <leader>, :Ack<Space>

"" ================ tig-explorer.vim ================
" Open tig with current file.
nnoremap <Leader>t :TigOpenCurrentFile<CR>

" Open tig blame with current file.
nnoremap <Leader>b :TigBlame<CR>

"" ================ cscope.vim ================
nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
nnoremap <leader>l :call ToggleLocationList()<CR>

" s: Find this C symbol.
nnoremap  <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
" g: Find this definition.
nnoremap  <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
" d: Find functions called by this function.
nnoremap  <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
" c: Find functions calling this function.
nnoremap  <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
" t: Find this text string.
nnoremap  <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
" e: Find this egrep pattern.
nnoremap  <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
" f: Find this file.
nnoremap  <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
" i: Find files #including this file.
nnoremap  <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>
