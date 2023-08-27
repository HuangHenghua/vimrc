set nocompatible
syntax on
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'file:///opt/vim/Vundle.vim'
Plugin 'file:///opt/vim/rainbow'
Plugin 'file:///opt/vim/lightline.vim'
Plugin 'file:///opt/vim/nerdcommenter'
Plugin 'file:///opt/vim/nerdtree'
Plugin 'file:///opt/vim/papercolor-theme'
Plugin 'file:///opt/vim/LeaderF'
call vundle#end()
filetype plugin indent on

" ======  Rainbow bracket ======
 let g:rainbow_active = 0 "0 if you want to enable it later via :RainbowToggle
 nmap <leader>rt :RainbowToggle<CR>

" ====== Nerdcommenter ======
" Create default mappings
let g:NERDCreateDefaultMappings = 1
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" cc
" cu
" ci   --- Comment/Uncomment
" cm   --- Comment with /* --- */
" cs   --- Comment with /* --- */


" ====== Lightline.vim ======
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'one',
      \ }

" ====== NERDTree ======
"F3-open q-exit
map <F3> :NERDTreeToggle<CR>
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ====== Ctags - TagList ======
let Tlist_Ctags_Cmd="/usr/bin/ctags"
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window = 1
map <F9> :TlistToggle<CR>
noremap <F6> :!ctags -R . <CR>

set tags=./tags,tags,../tags
set iskeyword+=`
" ====== LeaderF ======
let g:Lf_Ctags="/usr/bin/ctags"
let g:Lf_ShowDevIcons = 0
"let g:Lf_WorkingDirectoryMode = 'AF'
"let g:Lf_RootMarkers = ['.git', '.svn', '.hg', '.project', '.root']
let g:Lf_UseVersionControlTool=1 "default value, can ignore
let g:Lf_DefaultExternalTool='rg'
let g:Lf_PreviewInPopup = 1
let g:Lf_WindowHeight = 0.30
"let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {
        \ 'File': 0,
        \ 'Buffer': 0,
        \ 'Mru': 0,
        \ 'Tag': 0,
        \ 'BufTag': 1,
        \ 'Function': 1,
        \ 'Line': 1,
        \ 'Colorscheme': 0,
        \ 'Rg': 0,
        \ 'Gtags': 0
        \}
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_GtagsGutentags = 1
"let g:Lf_GtagsAutoGenerate = 1
"let g:Lf_Gtagslabel = 'native-pygments'
"let g:Lf_GtagsSource = 1

let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<c-l>'

noremap <leader>fh :LeaderfSelf<cr>
noremap <leader>fm :LeaderfMru<cr>
noremap <leader>ff :LeaderfFunction<cr>
noremap <leader>fb :LeaderfBuffer<cr>
noremap <leader>ft :LeaderfBufTag<cr>
noremap <leader>fl :LeaderfLine<cr>
noremap <leader>fa :LeaderfLineall<cr>
noremap <leader>fw :LeaderfWindow<cr>
noremap <leader>frr :LeaderfRgRecall<cr>

nmap <unique> <leader>fr <Plug>LeaderfRgPrompt
nmap <unique> <leader>fra <Plug>LeaderfRgCwordLiteralNoBoundary
nmap <unique> <leader>frb <Plug>LeaderfRgCwordLiteralBoundary
nmap <unique> <leader>frc <Plug>LeaderfRgCwordRegexNoBoundary
nmap <unique> <leader>frd <Plug>LeaderfRgCwordRegexBoundary

vmap <unique> <leader>fra <Plug>LeaderfRgVisualLiteralNoBoundary
vmap <unique> <leader>frb <Plug>LeaderfRgVisualLiteralBoundary
vmap <unique> <leader>frc <Plug>LeaderfRgVisualRegexNoBoundary
vmap <unique> <leader>frd <Plug>LeaderfRgVisualRegexBoundary

" ====== Theme ======
set t_Co=256
set background=light
colorscheme PaperColor
set number
"set relativenumber
set laststatus=2
set guifont=Consolas\ 12
"set guifont=Monospace\ 12
set linespace=2

" ====== Encoding ======
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8

" ====== Others ======
set mouse=n
set showcmd
set cmdheight=1
set foldenable
set foldmethod=manual
set nocompatible   "Not support vi
set autoread
set autowrite
set ruler
set magic
set foldcolumn=0
set autoindent
set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab   "Indent use blank not tab; noexpandtab means tab not blank
set history=1000
set nobackup
set noswapfile
set ignorecase
set wrap  " Not wrap: set nowrap
set nocompatible
"set paste

" ======  Auto remove blank ======
augroup vimrc
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
augroup END

" ====== Toggle tag  <\> +<i>  choose tab ======
 nmap <leader>1 1gt
 nmap <leader>2 2gt
 nmap <leader>3 3gt
 nmap <leader>4 4gt
 nmap <leader>5 5gt
 nmap <leader>6 6gt
 nmap <leader>7 7gt
 nmap <leader>8 8gt
 nmap <leader>9 9gt

 " ====== Option Notes ======
" :tabnew      --- Open New File
" :tabc        --- Close Current Tab
" :tabo        --- Close Other Tab
" :tabs        --- List All Tab
" :tabp        --- Previous Tab
" :tabn        --- Next Tab
" ctrl + 6     --- Swith Multi-file in Current Tab

" :sp
" :vsp
" ctrl + ww    --- Switch Window
" ctrl + w=    --- Equal All Windows
" ctrl + w_    --- Height to Max
" ctrl + w|    --- Width to Max
" ctrl + wc    --- Close Current Window

" :%retab!    --- set noexpandtab/expandtab to repalce to tab/blank

" :M,Ns/STRING//gn  --- Count STRING in line M->N
" :%s/STRING//gn    --- Count STRING in current file