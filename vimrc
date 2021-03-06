filetype on
filetype plugin on
execute pathogen#infect()
execute pathogen#helptags()

syntax on
let g:Powerline_symbols='fancy'
set nocompatible
set laststatus=2
colorscheme solarized
set background=dark

noremap <leader>s :VimuxPromptCommand<cr>
noremap <leader>q :VimuxInterruptRunner<cr>:VimuxCloseRunner<cr>
noremap <leader>w :VimuxInterruptRunner<cr>
noremap <leader><leader> :wa<cr>:VimuxRunLastCommand<cr>
noremap <leader>` :VimuxInspectRunner<cr>

noremap <leader>g :Gdiff<cr>
noremap <leader>c :Gcommit<cr>
noremap <leader>t :Gstatus<cr>

:noremap <Space> :set hlsearch! hlsearch?<CR>

noremap Q gq

nnoremap <A-a> <C-a>
nnoremap <A-x> <C-x>

noremap <C-p> :CtrlPMixed<cr>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_jump = 0
let g:syntastic_rust_rustc_exe = 'cargo check --tests'
let g:syntastic_rust_rustc_fname = ''
let g:syntastic_rust_rustc_args = '--'
let g:syntastic_rust_checkers = ['rustc']
let g:syntastic_rust_rustc_quiet_messages = { "level": "warnings" }
let g:syntastic_python_checkers=['flake8']

highlight ExtraWhitespace ctermbg=red guibg=red

" Show trailing whitespace:
match ExtraWhitespace /\s\+$/

" Make tab characters visible
set list
set listchars=tab:>-

function! s:SetColorColumn()
    if &textwidth == 0
        setlocal colorcolumn=80
    else
        setlocal colorcolumn=+0
    endif
endfunction

augroup colocolumn
    autocmd!
    autocmd OptionSet textwidth call s:SetColorColumn()
    autocmd BufEnter * call s:SetColorColumn()
augroup end

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
