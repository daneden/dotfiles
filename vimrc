set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"""""""""""""""""""""""""""""""
"
" Syntax Highlighting
"
"""""""""""""""""""""""""""""""

" Coffeescript
Plugin 'kchmck/vim-coffee-script'
Plugin 'mtscout6/vim-cjsx'

" (S)CSS
Plugin 'JulesWang/css.vim'
Plugin 'cakebaker/scss-syntax.vim'

" HTML5
Plugin 'othree/html5.vim'

" Less
Plugin 'groenewege/vim-less'

"""""""""""""""""""""""""""""""
"
" Git things
"
"""""""""""""""""""""""""""""""

" Git gutter
Plugin 'airblade/vim-gitgutter'

" Git wrapper
Plugin 'tpope/vim-fugitive'

" Git syntax stuff
Plugin 'tpope/vim-git'

"""""""""""""""""""""""""""""""
"
" Code helpers
"
"""""""""""""""""""""""""""""""

" Commenting
" Use gcc to comment/uncomment lines
Plugin 'tpope/vim-commentary'

" Surround (insert surrounding quotes etc)
Plugin 'tpope/vim-surround'

" Tab completions
Plugin 'ervandew/supertab'

" Linting!
Plugin 'scrooloose/syntastic'

" Dash for documentation
Plugin 'rizzatti/dash.vim'

" Editor Config
Plugin 'editorconfig/editorconfig-vim'

" Autoprefixer
Plugin 'daneden/vim-autoprefixer'

"""""""""""""""""""""""""""""""
"
" Misc. conveniences
"
"""""""""""""""""""""""""""""""

" Powerline
Plugin 'bling/vim-airline'

" Transparent pasting (cmd-v works as expected)
Plugin 'ConradIrwin/vim-bracketed-paste'

" Base16 themes
Plugin 'chriskempson/base16-vim'

" Other themes
Plugin 'flazz/vim-colorschemes'

" Dim inactive panes
Plugin 'blueyed/vim-diminactive'

" Fuzzy file/buffer finder
Plugin 'wincent/command-t'

" Ag
Plugin 'rking/ag.vim'

"""""""""""""""""""""""""""""""
"
" END OF PLUGINS
"
"""""""""""""""""""""""""""""""

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Set up SCSS Lint
let g:syntastic_scss_checkers = ['scss_lint']

"""""""""""""""""""""""""""""""
"
" Appearance & theming
"
"""""""""""""""""""""""""""""""

" Set syntax highlighting
syntax on

" Set linenums
set number

" Highlight cursor column & row
set cursorline
set cursorcolumn

hi CursorLineNR cterm=bold
augroup CLNRSet
    autocmd! ColorScheme * hi CursorLineNR cterm=bold
augroup END

" Color scheme
let base16colorspace=256
set background=dark
colorscheme base16-google
hi clear SignColumn

let g:airline_powerline_fonts=1

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" Dim inactive windows
autocmd VimEnter * DimInactive

"""""""""""""""""""""""""""""""
"
" Key mapping
"
" 2.2. General editor settings
"""""""""""""""""""""""""""""""

" Set smart case-matching for search
" This means searching for lowercase phrases matches both cases,
" and searching for uppercase matches only uppercase.
" Example: /ste will match Stephen, step, and misstep, but
" /Step will only match Stephen
set smartcase

" Automatically jump to and highlight search matches
set incsearch

"""""""""""""""""""""""""""""""

" Change leader key to something more accessible
let mapleader=","

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>q :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" Remap split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Set mapping for CommandT
nnoremap t :CommandT<cr>

" Set mapping to navigate back and forth in a query
nnoremap cn :cn<cr>
nnoremap cp :cp<cr>

"""""""""""""""""""""""""""""""
"
" CtrlP Config
"
"""""""""""""""""""""""""""""""

" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

"""""""""""""""""""""""""""""""
"
" Conveniences
"
"""""""""""""""""""""""""""""""

" More natural splitting
set splitbelow
set splitright

" Set tab options
" Expand tabs to spaces
set expandtab
" Set tab size
set tabstop=2
set shiftwidth=2

" Allow mouse interaction
set mouse=a

" Automatically make splits equal in size
autocmd VimResized * wincmd =

" Enable system clipboard
set clipboard=unnamed

" Automatically refresh changed files (if the buffer is unchanged)
set autoread

"""""""""""""""""""""""""""""""
"
" White space
"
"""""""""""""""""""""""""""""""

" Removes trailing spaces
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

nnoremap <silent> <Leader>rts :call TrimWhiteSpace()<CR>

" Automatically trim whitespace on save
autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()

autocmd BufWritePre * :%s/\s\+$//e

"""""""""""""""""""""""""""""""
"
" Thoughtbot's vimrc
"
"""""""""""""""""""""""""""""""

" Most of the rules from here on out are stolen from thoughtbot/dotfiles
" Make it obvious where 120 characters is
set textwidth=120
set colorcolumn=+1

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Cucumber navigation commands
  autocmd User Rails Rnavcommand step features/step_definitions -glob=**/* -suffix=_steps.rb
  autocmd User Rails Rnavcommand config config -glob=**/* -suffix=.rb -default=routes

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80

  " Automatically wrap at 72 characters and spell check git commit messages
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal spell

  " Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,scss,sass setlocal iskeyword+=-
augroup END

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
