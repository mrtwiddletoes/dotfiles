" init dot vim

" I'm never going to install these providers
let g:loaded_python_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0
let g:loaded_perl_provider = 0

" Handled by vim-matchup
let g:loaded_matchit = 1

let g:python3_host_skip_check = 1
if executable('python3')
  let g:python3_host_prog = exepath('python3')
endif

" always reset autocmds when sourcing vimrc
augroup vimrc
  autocmd!
augroup END

syntax enable

" Leader is space key
let g:mapleader = " "

" LocalLeader is the comma key
let g:maplocalleader = ","

" bootstrap vim-plug, if not installed.
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim-plug
nnoremap <leader>pc :PlugClean<cr>
nnoremap <leader>pg :PlugUpgrade<cr>
nnoremap <leader>ps :PlugStatus<cr>
nnoremap <leader>pu :PlugUpdate<cr>

call plug#begin(stdpath('data') . '/plugged')

" colorscheme
Plug 'lifepillar/vim-colortemplate', { 'on': 'ColorTemplate', 'for': 'colortemplate' }

" directory / file viewer. Largely replaces netrw.
" netrw still loads as it's useful for it's `gx` binding for opening URLs, and
" providing the backend for :Gbrowse for fugitive
Plug 'justinmk/vim-dirvish'

" Adds git added / modified / deleted in the sidebar (amongst other things)
" Use ]c / [c to go to hunks within a file
Plug 'airblade/vim-gitgutter'

" Better whitespace highlighting / provides :StripWhitespace
Plug 'ntpeters/vim-better-whitespace'
  nnoremap <silent> <leader>sw :StripWhitespace<cr>

Plug 'tpope/vim-fugitive' | Plug 'tpope/vim-rhubarb'
  " Bring up git status vertically
  nnoremap <silent> <leader>gs :vertical Git<cr>

  nnoremap <leader>gw :Gwrite<cr>
  nnoremap <leader>gc :Gcommit<cr>

  nnoremap <leader>gb :GBrowse<cr>
  xnoremap <Leader>gb :'<'>GBrowse<CR>

  nnoremap <leader>gy :.GBrowse!<cr>
  xnoremap <Leader>gy :'<'>GBrowse!<CR>

" Allows for viewing git commit messages related to the current line
" <leader>gm to trigger the window, again to go inside.
Plug 'rhysd/git-messenger.vim'

" up-to-date git filetypes
Plug 'tpope/vim-git'

" HTML5
Plug 'othree/html5.vim', { 'for': 'html' }

" CSS
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
augroup VimCSS3Syntax
  autocmd!

  autocmd FileType css setlocal iskeyword+=-
augroup END

" Javascript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'maxmellon/vim-jsx-pretty', { 'for': [ 'javascriptreact', 'typescriptreact' ] }

" typescript
Plug 'HerringtonDarkholme/yats.vim', { 'for': [ 'typescript', 'typescriptreact' ] }

" toml
Plug 'cespare/vim-toml'

" LaTeX
Plug 'lervag/vimtex'
  let g:vimtex_compiler_method = 'tectonic'

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  let g:go_imports_autosave = 1

  augroup GoMaps
    autocmd!
    autocmd FileType go nmap <buffer> <localleader>ru <Plug>(go-run)
    autocmd FileType go nmap <buffer> <localleader>re <Plug>(go-rename)
    autocmd FileType go nmap <buffer> <localleader>tn <Plug>(go-test-func)
    autocmd FileType go nmap <buffer> <localleader>tf <Plug>(go-test)
    autocmd FileType go nmap <buffer> <localleader>do <Plug>(go-doc)
    autocmd FileType go nmap <buffer> <localleader>de <Plug>(go-describe)
    autocmd FileType go nmap <buffer> <localleader>ae <Plug>(go-alternate-edit)
    autocmd FileType go nmap <buffer> <localleader>if <Plug>(go-iferr)
  augroup END

" JSON
Plug 'elzr/vim-json'
  let g:vim_json_syntax_conceal = 0

" for tmux.conf files
Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' }

" Clojure
Plug 'Olical/conjure', { 'for': 'clojure' }
Plug 'guns/vim-sexp', { 'for': 'clojure' } | Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
Plug 'eraserhd/parinfer-rust', { 'for': 'clojure', 'do': 'cargo build --release' }

" Automatically match parenthesis
Plug 'tmsvg/pear-tree'
  let g:pear_tree_repeatable_expand = 0

Plug 'tpope/vim-dispatch'
  " dispatch will open up a tmux window by default to do certain things - I
  " don't want this to occur by default since it'll 'un-zoom' tmux if I'm
  " zoomed on a pane.
  let g:dispatch_no_tmux_make = 1

Plug 'vim-test/vim-test'
  nmap <silent> t<C-n> :TestNearest<CR>
  nmap <silent> t<C-f> :TestFile<CR>
  nmap <silent> t<C-s> :TestSuite<CR>
  nmap <silent> t<C-l> :TestLast<CR>
  nmap <silent> t<C-g> :TestVisit<CR>
  let test#strategy = "dispatch"

" s{char}{char} to search for a set of two characters
Plug 'justinmk/vim-sneak'
  " use 's' again to go to the next match
  let g:sneak#s_next = 1
  map f <Plug>Sneak_f
  map F <Plug>Sneak_F
  map t <Plug>Sneak_t
  map T <Plug>Sneak_T

" Fuzzy find
Plug 'junegunn/fzf', { 'dir' : '~/.fzf', 'do' : { -> fzf#install() }}
Plug 'junegunn/fzf.vim'
  nnoremap <leader>f :Files<cr>
  nnoremap <leader><Enter> :GitFiles<cr>
  nnoremap <leader><leader> :Buffers<cr>
  nnoremap <leader>se :Rg<cr>

  let g:fzf_layout = { 'window': { 'width': 1.0, 'height': 0.5, 'yoffset': 1.0, 'border': 'top' } }

  command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

  nmap <leader><tab> <plug>(fzf-maps-n)
  xmap <leader><tab> <plug>(fzf-maps-x)
  omap <leader><tab> <plug>(fzf-maps-o)

" Plug 'takac/vim-hardtime'
"   let g:hardtime_default_on = 1
"   " default keys without '-', which is used to activate vim-dirvish
"   let g:list_of_normal_keys = ['h', 'j', 'k', 'l', '+', '<UP>', '<DOWN>', '<LEFT>', '<RIGHT>']
"   let g:hardtime_timeout = 2000

" Linting / fixing
Plug 'w0rp/ale'
  let g:ale_sign_error = '×'
  let g:ale_sign_warning = '→'
  let g:ale_sign_info = '→'
  let g:ale_echo_msg_format = '%linter%: %s'

  " In general, this is the right thing to do.
  let g:ale_fix_on_save = 1

  let g:ale_virtualtext_cursor = 1
  let g:ale_virtualtext_prefix = '∴ '

  nnoremap <silent> <leader>af :ALEFix<cr>
  nmap <silent> [w <Plug>(ale_previous_wrap)
  nmap <silent> ]w <Plug>(ale_next_wrap)

" Commenting
Plug 'tpope/vim-commentary'

" Adds unix shell commands
Plug 'tpope/vim-eunuch'

" Database access
Plug 'tpope/vim-dadbod', { 'on': 'DB'}

" Deal with parentheses, quotes, etc.
Plug 'tpope/vim-surround'

" Repeat plugin maps
Plug 'tpope/vim-repeat'

" Handy bracket ( ] and [ ) mappings
Plug 'tpope/vim-unimpaired'

" enhanced version of matchit plugin
Plug 'andymass/vim-matchup'
  " I don't really want this to override my status line
  let g:matchup_matchparen_offscreen = {}

" Easily search for, substitute, and abbreviate multiple variants of a word
Plug 'tpope/vim-abolish'

" colorscheme
Plug 'svanburen/rams.vim'

call plug#end()

set termguicolors
set background=light
colorscheme rams

" don't wrap by default
set nowrap

" if wrap is set, break on characters in 'breakat' rather than the last
" character that will fit on the screen.
" This _should_ mean that lines generally break on words
set linebreak
" on lines that will wrap, they instead 'break' and be visually indented by
" the showbreak character, followed by the indent.
set breakindent
set breakindentopt=shift:2,sbr
set showbreak=↳

" when using > and <, round the indent to a multiple of shiftwidth
set shiftround

" statusline current " "
" statusline not current " "
" vertical empty (escaped space)
" fold: filling foldtext
" diff: deleted lines in diff
set fillchars=stl:\ ,stlnc:\ ,vert:│,fold:·,diff:-

" fold based on syntax cues
set foldmethod=syntax
" turn off folding by default
set nofoldenable

" Global substitutions by default.
set gdefault

" Don't get rid of hidden buffers.
set hidden

" Show substitution results incrementally
set inccommand=nosplit

" Ignore case while searching
set ignorecase
" ... except when capitals are used
set smartcase

" Copy the indent of existing lines when autoindenting
set copyindent

" how long to wait in milliseconds before writing to disk
" this is set lower to help plugins like vim-gitgutter update their signs
set updatetime=100

" Helps when doing insert-mode completion
set infercase

" Don't redraw when using macros.
set lazyredraw

" Invisible characters
set nolist
set listchars=tab:⌁\ ,eol:¬,trail:⣿

" Don't insert two spaces after punctuation with a join command.
set nojoinspaces

" Don't show the mode on the command line - it's redundant with the status line.
set noshowmode

" line numbers
" setting these both together means that the current line number is the actual
" line number of the file, while the other line numbers are relative.
set number
set relativenumber

" maintain an undofile for undoing actions through neovim loads
set undofile

" Show matching brackets briefly.
set showmatch

" On horizontal split, open the split below.
set splitbelow
" On vertical split, open the split to the right.
set splitright

" cobbled from https://github.com/liuchengxu/vim-better-default
" o: disables
" c: no ins-completion-menu messages
set shortmess=atOIoc

" turn on mouse support
" this is useful for resizing windows, using the mouse wheel to scroll, etc
set mouse=a

" always use the system clipboard for operations
set clipboard+=unnamedplus

" turn off swapfiles - for now, I find these more of a headache than a benefit
set noswapfile

" Convenience for automatic formatting.
"   r - auto-insert comment leading after <CR> in insert mode
"   o - auto-insert comment leading after O in normal mode
set formatoptions+=r
set formatoptions+=o

" allows moving the cursor to where there is no actual character
set virtualedit=all

" ignore case when completing files / directories in wildmenu
set wildignorecase

" I don't use ';' often enough
nnoremap ; :

" always move by visual lines, rather than real lines
" this is useful when 'wrap' is set.
nnoremap <silent> j gj
nnoremap <silent> k gk
vnoremap j gj
vnoremap k gk

" Navigate between matching brackets
" These are specifically not `noremap`s because we want to be bound to
" whatever % is (usually a plugin, matchit / matchup).
nmap <tab> %
vmap <tab> %

" edit init.vim
nnoremap <silent> <leader>ev :e $MYVIMRC<cr>

" write to disk
nnoremap <leader>w :w<cr>

nnoremap <silent> <leader>q :q<cr>

nnoremap <leader>so :source $MYVIMRC<cr>
nnoremap <silent> <leader>sp :setlocal spell!<cr>

nnoremap <silent> <leader>cl :close<cr>
nnoremap <silent> <leader>ss :split<cr>
nnoremap <silent> <leader>vs :vsplit<cr>

" tab mappings
nnoremap <silent> ]r :tabn<cr>
nnoremap <silent> [r :tabp<cr>
nnoremap <silent> <leader>tn :tabnew<cr>

" Use Q to repeat last macro, rather than going into ex mode
nnoremap Q @@

" Swap the behavior of the ^ and 0 operators
" ^ Usually goes to the first non-whitespace character, while 0 goes to the
" first column in the line. ^ is more useful, but harder to hit, so swap it
" with 0
nnoremap 0 ^
nnoremap ^ 0

" always center the screen after any movement command
nnoremap <C-d> <C-d>zz
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz
nnoremap <C-u> <C-u>zz

nnoremap g;  g;zvzz
nnoremap g,  g,zvzz

nnoremap <silent> <leader>/ :nohlsearch<cr>

" easier way to exit insert mode - pressing 'jk' or 'kj' quickly
inoremap <silent> jk <esc>
inoremap <silent> kj <esc>

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" similar to vmap but only for visual mode - NOT select mode
" maintains the currently visual selection between invocations of '<' and '>'
xnoremap < <gv
xnoremap > >gv

" Resize splits when window is resized
autocmd vimrc VimResized * :wincmd =

augroup Filetypes
  autocmd!
  " weirdly enough, most of the *.html files I interact with are go templates.
  " For now, default them to being vim-go's `gohtmltmpl` filetype.
  autocmd BufRead,BufNewFile *.html setfiletype gohtmltmpl

  " files ending in .job.tpl or .nomad are likely terraform (HCL) files.
  autocmd BufRead,BufNewFile *.job.tpl setfiletype terraform
  autocmd BufRead,BufNewFile *.nomad setfiletype terraform
augroup END

" replaces vim-highlightedyank - briefly highlights the yanked text
" requires neovim 0.5.0
augroup LuaHighlight
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

" vim: expandtab:sw=2
