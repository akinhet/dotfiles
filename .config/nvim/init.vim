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
	Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
	Plug 'jiangmiao/auto-pairs'

" {{ File Managment }}
	Plug 'preservim/nerdtree'
	"Plug '907th/vim-auto-save'
	Plug 'ryanoasis/vim-devicons'

" {{ Git }}
	Plug 'jreybert/vimagit'

" {{ Syntax }}
	Plug 'sheerun/vim-polyglot'
	Plug 'captbaritone/better-indent-support-for-php-with-html'
	Plug 'vim-python/python-syntax'
	"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" {{ Programming }}
	Plug 'w0rp/ale'

" {{ Colors }}
	Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
	Plug 'srcery-colors/srcery-vim'
	Plug 'sainnhe/sonokai'
	Plug 'itchyny/landscape.vim'
	Plug 'nanotech/jellybeans.vim'

call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" << General options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" << The Basics >>
syntax on					" syntax highlightingu
filetype plugin indent on
set wildmenu				" autocompletion for commandmenu
set number relativenumber	" display line numbers
set signcolumn=number		" display sign column


"<< Tabs >>
set tabstop=4				" four spaces tab
"set expandtab				" convert tabs to spaces
set shiftwidth=4			" indents of four spaces
set softtabstop=4			" backspace will remove tabs instead of space
set autoindent				" copy indentation from previous line
"set smartindent			" use smarter indentation rules


"<< Cursor >>
set cursorline				" highlight current line
set scrolloff=5				" let x lines before/after cursor during scroll
set mouse=a					" enable use of the mouse


" << Search >>
set incsearch				" search as characters are entered
set ignorecase				" case insensitive search
set smartcase				" case sensitive when uppercase


" << Keybinds >>
map <C-s> <Esc>:w<CR>
tnoremap <Esc> <C-\><C-n>
"map <Left> <nop>
"map <Right> <nop>
"map <Up> <nop>
"map <Down> <nop>

" << Random stuff >>
set wrap					" wrap lines
set showmode!				" hide current mode
set showmatch				" highlight matching brackets
set t_Co=256				" terminal color
set laststatus=2			" Always display the status line
set noswapfile				" swap files won't be created
set nobackup				" no backup
set clipboard+=unnamedplus	" use system clipboard
set conceallevel=0			" 
let mapleader = " "			" space is the leader key
set noshowmode
let g:loaded_matchparen = 1
"au TextYankPost * silent! lua vim.highlight.on_yank()


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
let g:srcery_transparent_background = 1
let g:lightline = {'colorscheme': 'srcery'}


" << jellybeans.vim >>
"colorscheme jellybeans

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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" << Nerd Tree >>
map " :NERDTreeToggle<CR>
"map <C-t> :FZF<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" << toggleterm.nvim >>
lua << EOF
require("toggleterm").setup{}
EOF
tnoremap <leader>t <Cmd>exe v:count1 . "ToggleTerm direction=float"<CR>
nnoremap <leader>t <Cmd>exe v:count1 . "ToggleTerm direction=float"<CR>

" << Treesitter >>
"lua << EOF
"require'nvim-treesitter.configs'.setup {
	"ensure_installed = "maintained",
	"highlight = {
		"enable = true,
		"}
	"}
"EOF


" << auto-save >>
"au FileType java let g:auto_save = '1'
"au FileType c let g:auto_save = '1'
"au FileType cpp let g:auto_save = '1'
"au FileType python let g:auto_save = '1'
"au FileType html let g:auto_save = '1'
"au FileType css let g:auto_save = '1'
"au FileType js let g:auto_save = '1'
"au FileType txt let g:auto_save = '1'
"au FileType h let g:auto_save = '1'
"au FileType md let g:auto_save = '1'
"au FileType php let g:auto_save = '1'
"let g:auto_save = '0'
"let g:auto_save_silent = '1'
""let g:auto_save_events = ['CursorHold', 'CursorHoldI']
"let g:updatetime = 120000


" << ALE >> "
let g:ale_linters = {'python':['flake8','bandit']}

let g:ale_fixers = {'ada': ['gnatpp']}


" << Suda >>
let g:suda#prompt = 'Password: '



