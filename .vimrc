execute pathogen#infect()
filetype plugin indent on
filetype on
syntax on
set relativenumber
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set smarttab
colo torte
inoremap <C-j> <Esc>
let mapleader = " "
nnoremap <leader>n :NERDTree
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber
source ~/.vim/plugin/extempore.vim
set clipboard=unnamed
set clipboard=unnamedplus
set noerrorbells
set vb t_vb=

function! SetupTabstops()
    setlocal softtabstop=4
    setlocal tabstop=4
    setlocal shiftwidth=4
    setlocal expandtab
    set softtabstop=4
    set tabstop=4
    set shiftwidth=4
    set expandtab
endfunction
command! -bar SetupTabstops call SetupTabstops()

au VimEnter * if &diff | execute 'windo set wrap' | endif

nmap <F1> :echo<CR>
imap <F1> <C-o>:echo<CR>
