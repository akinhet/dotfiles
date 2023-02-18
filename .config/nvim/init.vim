" ___   _                  _   _         __     ___
"|_ _| | | _____   _____  | \ | | ___  __\ \   / (_)_ __ ___
" | |  | |/ _ \ \ / / _ \ |  \| |/ _ \/ _ \ \ / /| | '_ ` _ \
" | |  | | (_) \ V /  __/ | |\  |  __/ (_) \ V / | | | | | | |
"|___| |_|\___/ \_/ \___| |_| \_|\___|\___/ \_/  |_|_| |_| |_|


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" << Plugins via plugged
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin()

" {{ The Basics }}
    Plug 'itchyny/lightline.vim'
    Plug 'lambdalisue/suda.vim'
    Plug 'preservim/nerdcommenter'
    Plug 'jiangmiao/auto-pairs'
	Plug 'mhinz/vim-startify'

" {{ File Managment }}
	Plug 'preservim/nerdtree'
	Plug 'ryanoasis/vim-devicons'

" {{ Git }}
    Plug 'jreybert/vimagit'

" {{ Syntax }}
    Plug 'sheerun/vim-polyglot'
    Plug 'captbaritone/better-indent-support-for-php-with-html'
	Plug 'vim-python/python-syntax'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'vim-pandoc/vim-pandoc-syntax'
	"Plug 'vim-pandoc/vim-pandoc'

" {{ Programming }}
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
    Plug 'w0rp/ale'
	Plug 'sophacles/vim-processing'
	Plug 'wellle/context.vim'

" {{ Colors }}
    Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
    Plug 'srcery-colors/srcery-vim'
	Plug 'sainnhe/sonokai'
    Plug 'itchyny/landscape.vim'

call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" << General options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" << The Basics >>
syntax on                   " syntax highlightingu
filetype plugin indent on
set wildmenu                " autocompletion for commandmenu
set number relativenumber   " display line numbers
set signcolumn=number       " display sign column


"<< Tabs >>
set tabstop=4               " four spaces tab
"set expandtab               " convert tabs to spaces
set shiftwidth=4            " indents of four spaces
set softtabstop=4           " backspace will remove tabs instead of space
set autoindent              " copy indentation from previous line
"set smartindent            " use smarter indentation rules


"<< Cursor >>
set cursorline              " highlight current line
set scrolloff=5             " let x lines before/after cursor during scroll
set mouse=a                 " enable use of the mouse


" << Search >>
set incsearch               " search as characters are entered
set ignorecase              " case insensitive search
set smartcase               " case sensitive when uppercase


" << Keybinds >>
map <C-s> <Esc>:w<CR>
tnoremap <Esc> <C-\><C-n>
map <C-m> <Esc>:Magit<CR>
"map <Left> <nop>
"map <Right> <nop>
"map <Up> <nop>
"map <Down> <nop>


" << Random stuff >>
set wrap!                   " wrap lines
set showmode!               " hide current mode
"set showmatch              " highlight matching brackets
set t_Co=256                " terminal color
set laststatus=2            " Always display the status line
set noswapfile              " swap files won't be created
set nobackup                " no backup
"set undofile
set clipboard=unnamedplus   " use system clipboard
set conceallevel=0          " 
let mapleader = " "         " space is the leader key
set noshowmode
let g:loaded_matchparen = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" << Colorscheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" << Sonokai >>
"let g:sonokai_style = 'andromeda'
"let g:sonokai_enable_italic = 1
"let g:sonokai_transparent_background = 1 
"colorscheme sonokai


" << Spaceduck >>
"colorscheme spaceduck
"let g:lightline = {'colorscheme': 'spaceduck'}


" << Srcery >>
colorscheme srcery
let g:lightline = {'colorscheme': 'srcery'}


" << Terminal colors >>
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif


" << Basics >>
"highlight clear CursorLineNR
"hi cursorline guibg=NONE
"hi VertSplit ctermbg=NONE guibg=NONE
"hi Normal guibg=NONE ctermbg=NONE
"hi EndOfBuffer guibg=NONE ctermbg=NONE


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" << Plugin specific
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" << Nerd Tree >>
map " :NERDTreeToggle<CR>
map <C-t> :FZF<CR>
autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" << CoC >>
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


" << ALE >>
let g:ale_linters = {'python':['flake8','bandit']}  " 'pydocstyle','mypy',


" << Treesitter >>
lua <<EOF
require'nvim-treesitter.configs'.setup {
	ensure_installed = "all",
	highlight = {
		enable = true,
		}
}
EOF


" << Vim-Pandoc >>
augroup pandoc_syntax
	au! BufNewFile, BufFilePre, BufRead *.md set filetype=markdown.pandoc
augroup END

" << Python mode >>
let g:python_highlight_all = 1
let g:pymode_run_bind = "<F5>"
let g:pymode_warnings = 0


" << Suda >>
let g:suda#prompt = 'Password: '


" << Startify >>
let g:startify_session_before_save = [
      \ "ContextDisable"
      \ ]
