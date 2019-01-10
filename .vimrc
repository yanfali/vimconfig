if has('python3')
  silent! python3 1
endif

set nocompatible " be iMproved
filetype off

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'altercation/vim-colors-solarized'
Plug 'w0rp/ale'
Plug 'majutsushi/tagbar', { 'for': ['go'] }
Plug 'fatih/vim-go', { 'for': ['go'] }
Plug 'vim-airline/vim-airline'
Plug 'myusuf3/numbers.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'chrisbra/NrrwRgn'
Plug 'editorconfig/editorconfig-vim'
Plug 'posva/vim-vue', { 'for': ['js', 'vue'] }
Plug 'prettier/vim-prettier', { 'for': ['js', 'vue', 'html', 'css'] }
Plug 'ap/vim-css-color', { 'for': ['js', 'vue', 'html', 'css'] }
Plug 'leafgarland/typescript-vim', { 'for': ['ts'] }
Plug 'jparise/vim-graphql'
Plug 'tpope/vim-markdown', { 'for': ['md'] }
Plug 'rhysd/vim-grammarous', { 'for': ['txt', 'md'] }
Plug 'jtratner/vim-flavored-markdown', { 'for': ['md'] }
Plug 'reedes/vim-pencil', { 'for': ['txt', 'md'] }
call plug#end()
"
"Plugin 'ternjs/tern_for_vim'
"Plugin 'kien/ctrlp.vim'
"Plugin 'elixir-lang/vim-elixir'
"Plugin 'scrooloose/nerdtree'
"if !has('gui_running')
""Plugin 'Valloric/YouCompleteMe'
"endif
"Plugin 'Quramy/tsuquyomi'
""
"" markdown
"
"call vundle#end()

" Tsyququyomi
"
let g:tsuquyomi_completion_detail = 1

set tabstop=2
set shiftwidth=2
set shell=bash
let mapleader=","
let g:airline#extensions#ale#enabled = 1
set updatetime=250 " git-gutter runs too slowly without this
let g:ale_linters = {
\   'javascript': ['eslint'],
\}
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" mypy config for ale from nic
let g:ale_python_pylint_options = '-rcfile ~/.pylintrc'
let g:ale_python_mypy_options = '--python-version 3.6 --follow-imports silent'
let g:ale_python_flake8_options = '--max-line-length=119 --ignore=E402'

set expandtab
" set list
set number

au BufRead,BufNewFile *.html,*.php,*.js,*.css,*.rb,*.ejs,*.go set shiftwidth=4
au BufRead,BufNewFile *.html,*.php,*.js,*.css,*.rb,*.ejs,*.go set expandtab
au BufRead,BufNewFile *.html,*.php,*.js,*.css,*.rb,*.ejs,*.go set tabstop=4
au BufRead,BufNewFile *.html,*.php,*.js,*.css,*.rb,*.ejs,*.go set softtabstop=4

" python pep 8
au BufRead,BufNewFile *.py set textwidth=79 " lines longer than 79 cols broken
au BufRead,BufNewFile *.py set shiftwidth=4
au BufRead,BufNewFile *.py set tabstop=4
au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.py set softtabstop=4
au BufRead,BufNewFile *.py set shiftround
au BufRead,BufNewFile *.py set autoindent

autocmd FileType qf wincmd J


if !has('gui_running')
endif

syntax on
filetype plugin indent on

set t_Co=256
let g:solarized_termtrans = 1
let g:solarized_termcolors=256
let g:jsx_ext_required = 0
" let g:syntastic_javascript_checkers = ['eslint', 'jshint']
colorscheme solarized
set background=dark

let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set laststatus=2
set fillchars+=stl:\ ,stlnc:\
if has("gui_running")
  if has("gui_gtk2") || has("gui_gtk3")
      set guifont=Inconsolata\ 16
      " set guifont=Inconsolata\ 12
  else
      set guifont=Menlo:h15
  endif
endif

" experimental: run after gui has been started
" report breakage in this case, please
" au GUIEnter * call Activate()
"search options
set ignorecase "ignore case when searching
set infercase
set incsearch
set smartcase "override ignorecase when search pattern is on
set gdefault "make flag g by default for substitute
set hlsearch
set foldenable
set foldmethod=syntax
set foldopen=block,hor,tag    " what movements open folds
set foldopen+=percent,mark
set foldopen+=quickfix
set foldlevel=100             "Don't autofold

nnoremap <silent> <f6> :NERDTreeToggle<cr>
nnoremap <silent> <f3> :NumbersToggle<cr>
nnoremap - :Switch<cr>

" windowing key bindings
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>

"autocmd FileType js noremap <buffer> <c-j> :call JsBeautify()<cr>
"autocmd FileType html noremap <buffer> <c-j> :call HtmlBeautify()<cr>
"autocmd FileType ejs noremap <buffer> <c-j> :call HtmlBeautify()<cr>
"autocmd FileType css noremap <buffer> <c-j> :call CSSBeautify()<cr>
"autocmd FileType scss noremap <buffer> <c-j> :call CSSBeautify()<cr>
"autocmd FileType html compiler html
" will run esformatter after pressing <leader> followed by the 'e' and 's' keys

" vim-go settings
" jump to first detected error
"let g:syntastic_auto_jump=1
" error window opens when errors are detected and closes when none
let g:syntastic_auto_loc_list=1
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map= { 'mode':'active', 'active_filetypes':[], 'passive_filetypes': ['ejs', 'html', 'xhtml', 'scss', 'go']}
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:go_list_type = "quickfix"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
" show types under cursor
"let g:go_auto_type_info = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_metalinter_autosave = 1

au BufWritePre * :%s/\s\+$//e
set viminfo='100,\"2500,:200,%,n~/.viminfo

" vim-go key bindings
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <leader>gb <Plug>(go-doc-browser)
au FileType go nmap <leader>s <Plug>(go-implements)
au FileType go nmap <leader>i <Plug>(go-info)
au FileType go nmap <leader>e <Plug>(go-rename)

let g:tagbar_type_javascript = {
    \ 'ctagsbin' : '/Users/yanfali/.nvm/versions/node/v4.2.1/bin/jsctags'
\ }

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
nnoremap <f8> :TagbarToggle<cr>

if has("gui_running")
	autocmd BufEnter *.go nested TagbarOpen
endif

" Settings for Writting
let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'
let g:languagetool_jar  = '/opt/languagetool/languagetool-commandline.jar'

" Vim-pencil Configuration
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END

" Up/down/left/right {{{
 " unnoremap h h|xnoremap h h|onoremap h h|
 "   nnoremap n j|xnoremap n j|onoremap n j|
 "   nnoremap e k|xnoremap e k|onoremap e k|
 "   nnoremap i l|xnoremap i l|onoremap i l|
" }}}
"

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
