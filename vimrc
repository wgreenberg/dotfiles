execute pathogen#infect()

syntax on
let g:Powerline_symbols='fancy'
let g:solarized_termcolors=256
set nocompatible
set laststatus=2
set background=dark
colorscheme solarized

noremap <buffer> <silent> k gk
noremap <buffer> <silent> j gj
noremap <buffer> <silent> 0 g0
noremap <buffer> <silent> $ g$

noremap <leader>s :VimuxPromptCommand<cr>
noremap <leader>q :VimuxInterruptRunner<cr>:VimuxCloseRunner<cr>
noremap <leader><leader> :wa<cr>:VimuxRunLastCommand<cr>

set number
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smarttab

au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.class$', '\.o$', '\~$']
map <C-n> :NERDTreeToggle<cr>

set backup
set backupdir=~/.vim/backups
