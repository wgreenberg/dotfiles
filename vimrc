filetype on
execute pathogen#infect()

syntax on
let g:Powerline_symbols='fancy'
set nocompatible
set t_Co=16
set laststatus=2
colorscheme solarized
set background=dark
let g:solarized_termcolors=256

noremap <leader>s :VimuxPromptCommand<cr>
noremap <leader>q :VimuxInterruptRunner<cr>:VimuxCloseRunner<cr>
noremap <leader>w :VimuxInterruptRunner<cr>
noremap <leader><leader> :wa<cr>:VimuxRunLastCommand<cr>
noremap <leader>` :VimuxInspectRunner<cr>

noremap <leader>g :Gdiff<cr>
noremap <leader>c :Gcommit<cr>
noremap <leader>t :Gstatus<cr>

noremap Q gq

nnoremap <A-a> <C-a>
nnoremap <A-x> <C-x>

noremap <C-p> :CtrlPMixed<cr>

imap jk <esc>
inoremap kj jk

highlight ExtraWhitespace ctermbg=red guibg=red

" Show trailing whitespace:
match ExtraWhitespace /\s\+$/

set number
set colorcolumn=80
set backspace=indent,eol,start
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set smarttab

au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.am.inc set filetype=make

set wildignore+=*node_modules/*,*.lo,*.o,*.so
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.class$', '\.o$', '\~$']
map <C-n> :NERDTreeToggle<cr>

set nobackup
set noswapfile
