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
