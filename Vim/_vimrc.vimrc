augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" Vim ESCAPE Combinations{{{
	imap jj <esc>
" }}}

nnoremap <Space> /

map Q <nop>
nnoremap P "0p
vnoremap P "0p

" map space in normal mode to Search :)
"inoremap <S-space> <esc>


set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set number " Show line numbers
set ruler " Show position in file
set history=100

" show matching bracket
set showmatch
set incsearch
set hlsearch
" Pressing * will select a word and serch for it in a file
set ignorecase
set wildmenu  " show list instead of just completing
set wildmode=list:longest,full

set ai " Auto indent
set si " Smart indent
set wrap " Wrap lines

" Disable inserting new line characters in long lines
set textwidth=0 wrapmargin=0

set cursorline
set autoread

let g:mapleader = ','
let mapleader = ','

nnoremap - $
xnoremap - $

" Movement of cursorline
nnoremap <M-j> 10j
nnoremap <M-k> 10k

nnoremap <enter> i<cr><esc>

nnoremap <Leader>o mto<Esc>`t
nnoremap <Leader>O mtO<Esc>`t

nnoremap zj :join<CR>

" WINDOWS BINDINGS
" backspace in Visual mode deletes selection
vnoremap <BS> X

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y
nnoremap <leader>y" vi""+y
nnoremap <leader>y' vi'"+y
nnoremap <leader>y( vi("+y

" CTRL-V and SHIFT-Insert are Paste
noremap <S-Insert>		"+gp

cnoremap <C-V>		<C-R>+
cnoremap <S-Insert>		<C-R>+
" nnoremap p i<C-R>0<Esc> - DELETED - to much confusion with default behavior

""""""""""""""""""""""""""""""""""""""""
"  Yank File Stuff
""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>yn :let @+ = expand("%")<CR>
nnoremap <leader>yp :let @+ = expand("%:p:h")<CR>
nnoremap <leader>yf :let @+ = expand("%:p")<CR>


" CTRL-A is Select all
noremap <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG

" CTRL-S is Save File
inoremap <C-S> <Esc>:w!<cr>a

" after going to next find , center the screen on the finding "
noremap N Nzz
noremap n nzz

" Close window"
"============="
nnoremap zx :wq<CR>

"Find and Replace Text
vnoremap <F3> "hy:%s/<C-R>h//gc<left><left><left>
vnoremap <leader>re "hy:%s/<C-R>h//gc<left><left><left>
nnoremap <Leader>dw :%s/[ \n\t]//g

" Find selected text / Search for visual selected text
nnoremap <leader>ff yiw/<C-R>"<CR>
nnoremap <leader>f' yi'/<C-R>"<CR>
nnoremap <leader>f" yi"/<C-R>"<CR>
" vnoremap // y/<C-R>"<CR>
" FIND / SEARCH TEXT FROM CLIPBOARD
nnoremap <leader>fc /<C-R>+<CR>zz

"Find a WORD under cursor with vimgrep"
" "nnoremap <S-Space> "fyaW:vimgrep /\<<C-R>f\>/ *


nnoremap <leader>sc :set nohlsearch<CR>
    \Yp
    \V:s/[^\"\n]/=/g<CR>
    \kP
    \V:s/[^\"\n]/=/g<CR>
    \:let @/=""<CR>
    \:set hlsearch<CR>

" Pasting & replacing from 0 yank register
nnoremap <Leader>p "0p
nnoremap <Leader>r viW"0p
vnoremap rr "_dhP
vnoremap ra "ddh"ap
vnoremap a "ay

nnoremap <Leader>s" bi"<esc>ea"<Esc>b
nnoremap <Leader>s( bi(<esc>ea)<Esc>b
nnoremap <Leader>s{ bi{<esc>ea}<Esc>b

"
" Those lines need to be commented when you try to do BundleUpdate
" Other wise it will throw the vundle_last_status error
" https://github.com/VundleVim/Vundle.vim/wiki/Vundle-for-Windows
"set shell=powershell
"set shellcmdflag=-command

set visualbell

nnoremap <Leader>cd :cd %:p:h<CR>

" This will add header comment with default # sign
nnoremap <Leader>ch :center 80<CR>3hv0r#A<Space><Space><Esc>40A#<Esc>d80<Bar>YppVr#kk.
vnoremap <leader>cx <C-V>lx<ESC>
vnoremap <leader>c# <C-V>^I# <ESC>
vnoremap <leader>c' <C-V>^I' <ESC>
vnoremap <leader>c" <C-V>^I" <ESC>
vnoremap <leader>c/ <C-V>^I// <ESC>

let g:syntastic_shell = "/usr/bin/bash"

" REFRESH / RELOAD FILE 
noremap <F5> :e!<CR>G
noremap <C-R> :e!<CR>G
noremap <leader><leader> :e!<CR>G
" RELOAD THIS CONFIGURATION
nnoremap <C-F5> :source $MYVIMRC<CR>
nnoremap <leader>lc :source $MYVIMRC<CR>
" Save and run current file
noremap <S-F5> <Esc>:w<CR>:!%:p<CR>