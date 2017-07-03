filetype on
filetype plugin on
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

highlight ExtraWhitespace ctermbg=red guibg=red

" Show trailing whitespace:
match ExtraWhitespace /\s\+$/

" Make tab characters visible
set list
set listchars=tab:>-

set number
set colorcolumn=80
set backspace=indent,eol,start
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set smarttab

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.am.inc set filetype=make

set wildignore+=.lo,*.o,*.so
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.class$', '\.o$', '\~$']
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_custom_ignore=['node_modules']
map <C-n> :NERDTreeToggle<cr>

" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Enable omni completion.

" Close preview after autocompletion is done
autocmd CompleteDone * pclose

set nobackup
set noswapfile
