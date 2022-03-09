" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()

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
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" Fzf shortcut
nnoremap <leader>e :FZF<CR>

" noh - no highlight
map <esc> :noh <CR>

" Lua scripts
lua require('auto_complete')
lua require('rust')
lua require('lsp_config')
