source $VIM\_vimrc

" 进入主目录下的workdir目录
cd ~/workdir

" vim_abbreviation {{{
iabbrev @@ zhonghaodong123@qq.com
" }}}
" vim_set {{{
set autowrite
set helplang=cn,en
" regularize indentation
set shiftround
" 使用split或vsplit时，显示在右下
" set splitbelow
" set splitright
" set nobackup        " 不创建备份文件
" set nowritebackup   " 保存时不创建备份文件
" set noundofile      " 不创建撤销文件
" }}}
" vim_let {{{
let mapleader = ","
let maplocalleader = "\\"
let my_startup = "C:\\Users\\qwert\\AppData\\Roaming\\Microsoft\\Windows\\Start Menu\\Programs\\Startup"
" }}}
" vim_map setting {{{
" let jk to replace <Esc> or <C-[> {{{
inoremap jk <Esc>
" I don't know why using <Esc> here likes using <CR>
cnoremap jk <C-c>
vnoremap jk <Esc>
inoremap <Esc> <nop>
cnoremap <Esc> <nop>
inoremap <C-[> <nop>
cnoremap <C-[> <nop>
" }}}
" move quickly from different windows {{{
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
" }}}
" use <A-u> to upper {{{
inoremap <A-u> <Esc>gUiwea
nnoremap <A-u> mzgUiw`z
cnoremap <A-u> <C-f>hgUiwea
" }}}
" move current line {{{
nnoremap - ddp
nnoremap _ ddkP
vnoremap - ddp
vnoremap _ ddkP
" }}}
" Operator-Pending {{{
onoremap p i(
onoremap b /return<CR>
" inside next parentheses
onoremap in( :<C-u>normal! f(vi(<CR>
" inside last parentheses
onoremap il( :<C-u>normal! F)vi(<CR>
" makedown - title
onoremap ih :<C-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<CR>
" }}}
nnoremap <leader>n :nohls<CR>
noremap <C-n> :cnext<CR>
noremap <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" }}}
" Vimscript file setting {{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
" Golang file setting {{{
augroup filetype_go
	autocmd FileType go nnoremap <leader>b  <Plug>(go-build)
	autocmd FileType go nnoremap <leader>r  <Plug>(go-run)
	" autocmd FileType go :iabbrev <buffer> iff if {<left>
augroup END
" }}}
" Python file setting {{{
augroup filetype_python
	autocmd FileType python :iabbrev <buffer> iff if:<left>
augroup END
" }}}
" Javascript file setting {{{
augroup filetype_javascript
	" autocmd FileType javascript :iabbrev <buffer> iff if ()<left>
	" autocmd FileType javascript :iabbrev <buffer> {{ {<Esc>o}<Esc>O
augroup END
" }}}
" netrw {{{
" 设置netrw左侧的预览
" Netrw settings for left-side preview
" let g:netrw_banner = 0        " Disable banner
" let g:netrw_liststyle = 3     " Tree view
" let g:netrw_browse_split = 4  " Open in previous window
" let g:netrw_altv = 1          " Open splits to the right
" let g:netrw_winsize = 25      " Set width of Netrw window
" let g:netrw_preview = 1       " Preview window shown in a vertical split
"" Function to toggle Lexplore with <Leader>e
"function! ToggleLexplore()
    "if exists("t:expl_buf_num")
        "let expl_win_num = bufwinnr(t:expl_buf_num)
        "if expl_win_num != -1
            "let cur_win_nr = winnr()
            "exec expl_win_num . 'wincmd w'
            "close
            "exec cur_win_nr . 'wincmd w'
            "unlet t:expl_buf_num
        "else
            "unlet t:expl_buf_num
        "endif
    "else
        "exec '1wincmd w'
        "Lexplore
        "let t:expl_buf_num = bufnr("%")
    "endif
"endfunction
"
"" Map <Leader>e to toggle Lexplore
"nnoremap <silent> <Leader>e :call ToggleLexplore()<CR>
" }}}
" vim-plug {{{
call plug#begin()
" the help of vim-plug
Plug 'junegunn/vim-plug'
" Create your own text objects
Plug 'kana/vim-textobj-user'
" to select whole file by ae/ie
Plug 'kana/vim-textobj-entire'
" visual-star-search
Plug 'bronson/vim-visual-star-search'
" commentary
Plug 'tpope/vim-commentary'
" vim-go haha I can use it, and it's exciting.
Plug 'fatih/vim-go', { 'tag': '*', 'do': ':GoUpdateBinaries' }
" Chinese vimdoc
Plug 'yianwillis/vimcdoc'
" python plugin, default closed
Plug 'python-mode/python-mode', { 'for': [], 'branch': 'develop' }
" a file system explorer
Plug 'preservim/nerdtree', { 'on': [] }
" Auto Pairs
Plug 'jiangmiao/auto-pairs'
call plug#end()
" }}}
