"" ================ vim-plug ================
" vim-plug configuration
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !mkdir -p ~/.vim/autoload/ && wget -O ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
 
call plug#begin('~/.vim/plugged')

" Fetch plugins from the below GitHub repos
Plug 'tpope/vim-sensible'
Plug 'altercation/vim-colors-solarized'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdcommenter'
Plug 'google/vim-searchindex'

" Use ':PlugUpdate' after making changes
call plug#end()

"" ================ bindings ================
let mapleader=" "		" use space as mapleader

"" ================ seaching ================
set hlsearch			" highlight all matches

"" ================ CtrlP ================
" Ignore files listed in .gitignore
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Use <\> + <.> to start tags search
nnoremap <leader>. :CtrlPTag<cr>

" Move ctrlp match window to top, reverse match order and show more results
let g:ctrlp_match_window = 'top,order:ttb,max:60'

" Open file in new tab by default
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

"" ================ ack.vim ================
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Use <\> + <,> to start string search
nnoremap <leader>, :Ack<Space>

"" ================ appearance ================
syntax enable
set background=dark
colorscheme solarized		" must come after vim-plug
