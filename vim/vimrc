set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage itself
Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'tpope/vim-sensible'
Plugin 'w0rp/ale'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'morhetz/gruvbox'
Plugin 'sheerun/vim-polyglot'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ycm-core/YouCompleteMe'

" End plugins
call vundle#end()
filetype plugin indent on

" General settings
syntax on
set noswapfile
set nobackup
set noerrorbells visualbell t_vb=
set expandtab
set softtabstop=2
set shiftwidth=2
set termguicolors
colorscheme gruvbox

" Relative line numbers on
set relativenumber
set rnu

" Set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Disable arrow keys
noremap! <Up> <NOP>
noremap <Up> <NOP>
noremap! <Down> <NOP>
noremap <Down> <NOP>
noremap! <Left> <NOP>
noremap <Left> <NOP>
noremap! <Right> <NOP>
noremap <Right> <NOP>

" Fzy
function! FzyCommand(choice_command, vim_command)
  try
    let output = system(a:choice_command . " | fzy ")
  catch /Vim:Interrupt/
    Swallow errors from ^C, allow redraw! below
  endtry
  redraw!
  if v:shell_error == 0 && !empty(output)
    exec a:vim_command . ' ' . output
  endif
endfunction
nnoremap <leader>e :call FzyCommand("ag . --silent -l -g ''", ":e")<cr>
nnoremap <leader>v :call FzyCommand("ag . --silent -l -g ''", ":vs")<cr>
nnoremap <leader>s :call FzyCommand("ag . --silent -l -g ''", ":sp")<cr>

" Enable mouse
set mouse=a

" Fix tmux changing colors
set background=dark
set t_Co=256

" System clipboard
set clipboard=unnamed

" 80 char delimeter
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=#3c3836

" Trim trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e
let g:lightline = {
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ],
    \ }
    \ }

" ALE
let g:ale_linters = {'python': ['flake8']}
let g:ale_fixers = {'*': [], 'python': ['black']}
