call plug#begin('~/.vim/plugged')

" General
Plug 'tpope/vim-sensible'
Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'christoomey/vim-tmux-navigator'

" Autocomplete
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" Rust
Plug 'simrat39/rust-tools.nvim'

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" General settings
syntax on
set completeopt=menu,menuone,noselect
set mouse=a
set noswapfile
set nobackup
set noerrorbells visualbell t_vb=
set expandtab
set softtabstop=2
set shiftwidth=2
set termguicolors
set relativenumber

" Fix tmux changing colors
set background=dark
set t_Co=256

" System clipboard
set clipboard=unnamed

" 80 char delimiter
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=#3c3836

" Color scheme
colorscheme gruvbox
let g:lightline = {'colorscheme': 'gruvbox'}

" Fzf shortcut
nnoremap <leader>e :FZF<CR>

" noh - no highlight
map <esc> :noh <CR>

" Lua scripts
lua require('auto_complete')
lua require('rust')
