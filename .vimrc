if has('python3')
  silent! python3 1
endif

set nocompatible " be iMproved

let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-yaml',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-stylelint',
  \ 'coc-prettier',
  \ 'coc-highlight',
  \ 'coc-emmet',
  \ 'coc-snippets',
  \ 'coc-vetur',
  \ 'coc-angular',
  \ 'coc-git'
  \ ]

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'altercation/vim-colors-solarized'
"Plug 'w0rp/ale', { 'for': ['sccs','css','vue','javascript','typescript','json','python'] }
Plug 'majutsushi/tagbar', { 'for': ['go'] }
Plug 'fatih/vim-go', { 'for': ['go'] }
Plug 'vim-airline/vim-airline'
Plug 'myusuf3/numbers.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'chrisbra/NrrwRgn'
Plug 'editorconfig/editorconfig-vim'
"Plug 'posva/vim-vue', { 'for': ['javascript', 'vue'] }
Plug 'prettier/vim-prettier', { 'for': ['javascript', 'vue', 'html', 'css'] }
Plug 'ap/vim-css-color', { 'for': ['javascript', 'vue', 'html', 'css'] }
Plug 'jparise/vim-graphql'
Plug 'tpope/vim-markdown', { 'for': ['markdown'] }
Plug 'rhysd/vim-grammarous', { 'for': ['text', 'markdown'] }
Plug 'jtratner/vim-flavored-markdown', { 'for': ['markdown'] }
Plug 'reedes/vim-pencil', { 'for': ['text', 'markdown'] }
Plug 'hail2u/vim-css3-syntax', { 'for': 'css, vue' }
Plug 'jonsmithers/vim-html-template-literals', { 'for': 'js' }
Plug 'pangloss/vim-javascript', { 'for': ['vue','javascript'] }
Plug 'kien/ctrlp.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'junegunn/fzf.vim'
Plug 'ciaranm/securemodelines'
Plug 'neoclide/coc.nvim', {'branch': 'release', 'tag': '\*', 'do': './install.sh'}
Plug 'ianks/vim-tsx',
Plug 'freitass/todo.txt-vim'
call plug#end()

let g:LanguageClient_serverCommands = {
    \ 'vue': ['vls']
    \ }
"
" Plug 'morhetz/gruvbox'
"Plugin 'ternjs/tern_for_vim'
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

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.

" Tsyququyomi
"
let g:rg_command = 'rg --vimgrep -S'

" FZF
set rtp+=/usr/local/opt/fzf
" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

set tabstop=2
set shiftwidth=2
set shell=bash
let mapleader=","
let g:airline#extensions#ale#enabled = 1
set updatetime=250 " git-gutter runs too slowly without this

let g:ale_fix_on_save = 1
let g:ale_linters_explicit = 1
let g:ale_linters = {
\   'scss': ['prettier'],
\   'css': ['prettier'],
\   'vue': ['eslint'],
\   'javascript': ['eslint'],
\   'typescript': ['tsserver'],
\   'json': ['prettier'],
\   'python': ['flake8'],
\}
let g:ale_fixers = {
      \ 'json': ['prettier'],
      \ 'css': ['prettier'],
      \ 'scss': ['prettier'],
      \ 'vue': ['prettier'],
      \ 'typescript': ['prettier'],
      \ 'javascript': ['prettier'],
      \ 'python': ['yapf'],
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

syntax on
filetype plugin indent on
packadd! matchit

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
"	autocmd BufEnter *.go nested TagbarOpen
endif

" experimental: run after gui has been started
" report breakage in this case, please
" au GUIEnter * call Activate()
"search options
set ignorecase "ignore case when searching
set infercase
set incsearch
set smartcase "override ignorecase when search pattern is on
set hlsearch
set foldenable
set foldmethod=syntax
set foldopen=block,hor,tag    " what movements open folds
set foldopen+=percent,mark
"set foldopen+=quickfix
set foldlevel=100             "Don't autofold

nnoremap <silent> <f6> :NERDTreeToggle<cr>
nnoremap <silent> <f3> :NumbersToggle<cr>
nnoremap - :Switch<cr>
noremap <silent> <leader>o :Files<cr>
noremap <silent> <leader>O :Files!<cr>

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
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
"" show types under cursor
"let g:go_auto_type_info = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
"let g:go_def_mapping_enabled = 0
"let g:go_metalinter_enabled = ["deadcode", "errcheck", "gosimple", "ineffassign", "staticcheck", "structcheck", "typecheck", "unused", "varcheck"]
let g:go_metalinter_autosave_enabled = ["govet","golint"]
let g:go_metalinter_autosave = 0
let g:go_list_type = "quickfix"


" remove spaces on ends of lines
"au BufWritePre * :%s/\s\+$//e
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

"let g:prettier#autoformat = 0
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
" validate with prettier on save
"autocmd BufWritePre *.js,*.jsx,*.vue PrettierAsync

source ~/.vim/coc.vimrc
