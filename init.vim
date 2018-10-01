set encoding=utf8
call plug#begin('~/.local/share/nvim/plugged')
" Fuzzy file finder
Plug 'tpope/vim-jdaddy'
" pretty json
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Async runner for bash
Plug 'skywind3000/asyncrun.vim'
" Ale, an async linter for vim
Plug 'w0rp/ale'
"lightline status bar
Plug 'itchyny/lightline.vim'
"Plugin to integrate Ale and lightline
Plug 'maximbaz/lightline-ale'
" Super Tab allows for tab completion in insert mode
Plug 'ervandew/supertab'
" Auto Commenter
Plug 'scrooloose/nerdcommenter'
" Nerd Tree, a file manager for vim
Plug 'scrooloose/nerdtree'
"Eunuch for file management in nerdtree pane
Plug 'tpope/vim-eunuch'
"Some react JS and JSX syntax engines
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'ryanoasis/vim-devicons'
Plug 'rakr/vim-two-firewatch'
"Versatile syntax plugin
Plug 'sheerun/vim-polyglot'
" deoplete, an async completion engine.
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Python Completion for deoplete
Plug 'zchee/deoplete-jedi'
"JavaScript completion with tern
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
" Emmet for vim
Plug 'mattn/emmet-vim'
"git tools
Plug 'airblade/vim-gitgutter'
"multiple cursors
Plug 'terryma/vim-multiple-cursors'
"For grep
Plug 'mileszs/ack.vim'
"Silver Searcher
Plug 'numkil/ag.nvim'
"change surrounding characters
Plug 'tpope/vim-surround'
"allow '.' key to repeat plugin commands
Plug 'tpope/vim-repeat'
"delete buffers without closing windows
Plug 'qpkorr/vim-bufkill'
"peaksea color scheme
Plug 'vim-scripts/peaksea'
"Plug 'marciomazza/vim-brogrammer-theme'
"auto docstring generator for python
Plug 'heavenshell/vim-pydocstring'
"JSON highlighting and pretty printing
Plug 'tpope/vim-jdaddy'
"ReasonML syntax
Plug 'reasonml-editor/vim-reason-plus'
"Language Client for reasonml
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
"edit wikies from vim"
Plug 'aquach/vim-mediawiki-editor'
call plug#end()

"python docstring shortcut
let g:pydocstring_enable_mapping = 0
nmap <C-i> :Pydocstring<CR>

" re-map leader key to ';'
let mapleader=";"


set termguicolors
if ! has("gui_running")
  set t_Co=256
endif
set background=dark
colors peaksea
"colors brogrammer
filetype on             " vim will try to detect the file type
filetype plugin on      " if i'm using a plugin for this filetype it will get loaded

set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matche
set hidden              " let vim leave unwritten buffers

let g:mediawiki_editor_url = 'wiki.minted.com'
let g:mediawiki_editor_path = '/'
let g:mediawiki_editor_username = 'nick.james'
let g:mediawiki_editor_password = 'FfUR6ZcpQasJZAU5rhv3'


"" GitGutter
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

" Fuzzy file finder to behave like cntrl-P
nnoremap <c-p> :FZF<cr>
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
" FZF (replaces Ctrl-P, FuzzyFinder and Command-T)
set rtp+=/usr/local/opt/fzf
set rtp+=~/.fzf

"Buffer controls
nmap ; :buffers<CR>
nmap <C-d> :BD<cr>
nmap <C-c> :BD!<cr>
nnoremap <C-a> :bp<CR>
nnoremap <C-s> :bn<CR>
nnoremap <C-t> <C-^>
nmap <Leader>r :Tags<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>a :Ag<CR>

"tell fzf to use Silver Searcher to filter out gitignored files
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
let g:ackprg = 'ag --vimgrep'

"Change arrow keys to escape to stop using them!
noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>

"ctrl modifier to move through splits
noremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>
noremap <C-H> <C-W><C-H>

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif
let g:ackprg = 'ag --nogroup --nocolor --column'

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Bind \ to do our Ag:
nnoremap \ :Ag<SPACE>

let g:python_host_prog = '/Users/nickjames/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/nickjames/.pyenv/versions/neovim3/bin/python'

" JSX highlighting in JS files
let g:jsx_ext_required = 0

" enable deoplete on startup
let g:deoplete#enable_at_startup = 1

"Add extra filetypes
let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ ]

" Set this. Airline will handle the rest.
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
let g:ale_linters = {'javascript': ['eslint']}
let g:ale_fixers = {
      \   'javascript': ['prettier-eslint'],
      \ }
let g:ale_javascript_eslint_executable = 'eslint_d'
let g:ale_javascript_eslint_use_global = 0
let g:ale_javascript_prettier_eslint_executable = 'node_modules/.bin/prettier-eslint'
let g:ale_javascript_prettier_eslint_use_global = 0
let g:ale_fix_on_save = 1

"Status line settings

let g:lightline = {
  \   'colorscheme': 'Dracula',
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
  \     ]
  \   },
	\   'component': {
	\     'lineinfo': ' %3l:%-2v',
	\   },
  \   'component_function': {
  \     'gitbranch': 'fugitive#head',
  \   }
  \ }
let g:lightline.separator = {
	\   'left': '', 'right': ''
  \}
let g:lightline.subseparator = {
	\   'left': '', 'right': '' 
  \}
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"
let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]] }

" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

"remap emmet-vim Cntrl y to contrl e
let g:user_emmet_expandabbr_key='<C-E>'
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends': 'jsx',
\      'quote_char': "'",
\  },
\}

" Auto open nerdtree and set some configurations
"autocmd vimenter * NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeIgnore = ['\.pyc$']
nmap <C-o> :NERDTreeToggle<CR>

"use j+j to exit insert mode
:imap jj <Esc>

"prevent multi-cursor from conflicting with deoplete
func! Multiple_cursors_before()
    call deoplete#init#_disable()
endfunc
func! Multiple_cursors_after()
    call deoplete#init#_enable()
endfunc

function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre *.py,*.js,*.sql,*.yml,*.yaml,*.html,*.css :call <SID>StripTrailingWhitespaces()

nnoremap gp `[v`]

set shiftwidth=2 tabstop=2 softtabstop=2  expandtab
" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction

function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction
