" mrtwiddletoes .vimrc

" Pathogen!--------------------------

execute pathogen#infect()

" Basic things!----------------------

syntax enable                       " Syntax highlighting please

"let g:Powerline_symbols = 'fancy'

colorscheme solarized               " Solarized!

filetype on                         " Pay attention to filetype.
filetype plugin on                  " Use plugins based on the type of file I'm editing.
filetype indent on                  " Indent based on the type of file I'm editing.

" Settings!--------------------------

set background=dark                 " For colorscheme
set nocompatible                    " Vim, not vi.
set autoindent                      " Autoindent stuff.
set smartindent                     " Indent my things smartly.
set ignorecase                      " Ignore case when searching.
set smartcase                       " Once again, ignore case while searching.
set autoread                        " Read changes in files during editing.
set autowriteall                    " Make sure I'm saving things.
set showmatch                       " Show matching brackets, parentheses, etc.
set nowrap                          " No wrapping.
set ruler                           " Show line number and column number.
set encoding=utf-8                  " Force encoding to be utf-8.
set t_Co=256                        " 256 color terminal.
set relativenumber                  " Show line numbers relative to current line.
set cmdheight=2                     " Bigger command-line height.
set visualbell                      " No bell sound.
set incsearch                       " Keep searching as I type.
set hlsearch                        " Highlight my searches.
set cursorcolumn                    " Highlight the cursor column.
set cursorline                      " Highlight the cursor line.
set nostartofline                   " No moving to the start of the line when scrolling.
set title                           " Title of terminal = file being edited.
set colorcolumn=80                  " Sets a column of color at 80 characters.
set list                            " Displays invisible characters.
set listchars=tab:>-,eol:$,trail:.  " List of invisible characters to display.
set laststatus=2                    " Always show the last command.
set noswapfile                      " Don't use swap files.
set nobackup                        " No need to backup files. Perfect memory.
set wildmenu                        " Turn on wildmenu.
set wildmode=list:longest,full      " Wildmenu options.
set showmode                        " Show the mode I'm in.
set showcmd                         " Show the command.
set ttyfast                         " Assume we're using a tty.
set foldenable                      " Allow folding.
set foldmethod=marker               " Use the marker folding method.
set lazyredraw                      " Don't redraw when using macros.

let mapleader = ","                 " Use ',' as leader

" Highlights!------------------------

highlight ColorColumn     ctermbg=4 ctermfg=1
highlight ExtraWhitespace ctermbg=2 ctermfg=3
highlight CursorColumn    ctermbg=16
highlight CursorLine      ctermbg=16
highlight StatusLine      ctermbg=4 ctermfg=1
highlight StatusLineNC    ctermbg=9 ctermfg=12
highlight IncSearch       ctermbg=1 ctermfg=4
highlight VertSplit       ctermbg=1
highlight MatchParen      ctermbg=1 ctermfg=4
highlight Visual          ctermbg=1 ctermfg=4

" Functions!-------------------------

function! NumberToggle()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunc

" Mappings!--------------------------

" Normal Mode:
nnoremap ; :
nnoremap / /\v
nnoremap p p'[v']=
nnoremap Y y$
nnoremap 0 ^
nnoremap ^ 0
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <tab> %
nnoremap <f8> :call NumberToggle()<cr>

" Command Mode:
cnoremap %s/ %s/\v
cnoremap w!! w !sudo tee % >/dev/null

" Insert Mode:
inoremap jk <Esc>
inoremap kj <Esc>
inoremap <esc> <nop>

" All Modes:
noremap <Leader>f <C-w>w
noremap <Leader>w :w<CR>
noremap <Leader>q :wq<CR>
noremap <Leader>v :vsplit<CR>
noremap <Leader>s :split<CR>
noremap <Leader>/ :nohl<CR>
noremap <Leader>r :retab<CR>
noremap <Leader>e :vsplit $MYVIMRC<CR>
noremap <f9> :!javac %<CR>
noremap <f10> :!gcc %<CR>
noremap <f11> :!python %<CR>
noremap <f12> :!clisp %<CR>
noremap <Leader>n :NerdTreeToggle<CR>
