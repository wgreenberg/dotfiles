execute pathogen#infect()

syntax on
let g:Powerline_symbols='fancy'
let g:solarized_termcolors=256
set nocompatible
set t_Co=16
set laststatus=2
set background=dark
colorscheme solarized

noremap <leader>s :VimuxPromptCommand<cr>
noremap <leader>q :VimuxInterruptRunner<cr>:VimuxCloseRunner<cr>
noremap <leader>w :VimuxInterruptRunner<cr>
noremap <leader><leader> :wa<cr>:VimuxRunLastCommand<cr>

set number
set backspace=indent,eol,start
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set smarttab

au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.class$', '\.o$', '\~$']
map <C-n> :NERDTreeToggle<cr>

set backup
set backupdir=~/.vim/backups
