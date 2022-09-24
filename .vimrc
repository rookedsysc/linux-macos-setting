set nu
set nocompatible
set tabstop=4
set shiftwidth=4
set ruler
set hlsearch
set incsearch
set scrolloff=2
set ts=4
set sts=4
set autoread
set smartcase
set smarttab
set smartindent
set showmatch
set laststatus=2
set encoding=utf-8
set fileencodings=utf-8,euc-kr,cp949
filetype off
syntax on

set rtp+=~/.vim/bundle/vundle/

call vundle#rc()
Plugin 'tpope/vim-fugitive' " fugitive / github for vim
Plugin 'scrooloose/syntastic' " hack syntastic
Plugin 'gregsexton/MatchTag' " MatchTag
Plugin 'c9s/colorselector.vim' " color selector
Plugin 'Lokaltog/vim-powerline' " power line
Plugin 'python_match.vim' " python match
Plugin 'tpope/vim-surround' 

" Auto Complete
Plugin 'honza/vim-snippets' " snippets
Plugin 'valloric/youcompleteme' " youcomplete
Plugin 'MarcWeber/vim-addon-mw-utils' " vim-addon-mw-utils
Plugin 'tomtom/tlib_vim' " tlib

" File Manager
Plugin 'kien/ctrlp.vim' 
Plugin 'scrooloose/nerdtree' " nerdtree

" Web Language
Plugin 'ap/vim-css-color' " css-color
Plugin 'mattn/emmet-vim' " emmet

" Compiler
Plugin 'ironcamel/vim-script-runner' " script runner
Plugin 'xuhdev/SingleCompile' " compiler
Plugin 'L9' " L9 : Script Runner

" Code Trace
Plugin 'hewes/unite-gtags'
Plugin 'Shougo/unite.vim'
Plugin 'majutsushi/tagbar'
Plugin 'Shougo/unite-outline'
Plugin 'Shougo/vimproc.vim'

" Dart syntax
Plugin 'dart-lang/dart-vim-plugin'

" MarkDown Preview
Plugin 'iamcco/markdown-preview.nvim'

Plugin 'gosukiwi/vim-atom-dark' " Atom Dark Theme
call vundle#end()
set t_Co=256

" Ycm Setting
let g:ycm_min_num_of_chars_for_completion = 1

" Key Mapping
let g:Powerline_symbols='fancy'
let g:Powerline_cache_enabled = 0
let g:user_emmet_leader_key='<C-e>' 
let g:acp_behaviorSnipmateLength = 1
let g:script_runner_key = '<F9>'
let g:unite_source_grep_recursive_opt = ''
let g:unite_source_grep_search_word_highlight=1
map <Tab> :NERDTreeToggle<CR>
nmap <F12> :SCCompileRun<cr>
" Key Mapping For gtags
nnoremap <leader>gd :Unite gtags/def:
nnoremap <leader>gr :Unite gtags/ref:
nnoremap <leader>gg :Unite grep<CR>
nnoremap <silent><leader>gc :Unite gtags/context<CR>
nnoremap <leader>df :DartFmt<cr>

" Last Edit Point
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

" Does anybody know what this is?
if executable('ag')
	let g:unite_source_grep_command = 'ag'
	let g:unite_source_grep_default_opts = '--nogroup --nocolor --column --ignore=*.pyc --ignore=*.o --ignore=*.ko'
elseif executable('awk')
	let g:unite_source_grep_command='ack'
	let g:unite_source_grep_default_opts='--no-group --no-color -k -H'
endif

" File Encoding Lang: Korean
if $LANG[0]=='k' && $LANG[1]=='o'
set fileencoding=korea
endif

filetype plugin indent on
filetype indent on
