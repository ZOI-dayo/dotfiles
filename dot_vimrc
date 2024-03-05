" setting
"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd

let $LANG = "ja"
set helplang=ja

" 見た目系
" 行番号を表示
set number
set numberwidth=3
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
" set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
" シンタックスハイライトの有効化
syntax enable

" 行をまたいで移動
set whichwrap=b,s,h,l,<,>,[,],~
" タイトルを表示
set title


" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2


" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" Clipboard
set clipboard=unnamed

" auto reload .vimrc
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END

" auto comment off
augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
augroup END

" HTML/XML閉じタグ自動補完
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END


"===== マウス設定 =====
set mouse=a
if !has('nvim')
  set ttymouse=xterm2
endif

" 折り畳み
set nofoldenable
set foldcolumn=0
" set foldmethod=syntax
" set foldlevel=2

" netrw
filetype plugin on
" ファイルツリーの表示形式、1にするとls -laのような表示になります
let g:netrw_liststyle=1
" ヘッダを非表示にする
let g:netrw_banner=0
" サイズを(K,M,G)で表示する
let g:netrw_sizestyle="H"
" 日付フォーマットを yyyy/mm/dd(曜日) hh:mm:ss で表示する
let g:netrw_timefmt="%Y/%m/%d(%a) %H:%M:%S"
" プレビューウィンドウを垂直分割で表示する
let g:netrw_preview=1

" not allow edit in readonly file
augroup readonly
  autocmd!
  autocmd BufEnter * if &readonly == 1 | set nomodifiable | else | set modifiable | endif
augroup END

" font
set guifont=Cica:h14
set printfont=Cica:h9
set ambiwidth=double

command Term bo terminal

let g:ale_disable_lsp = 1

" Jetpack
let data_dir = has('nvim') ? '~/.config/nvim' : '~/.vim'
if empty(glob(data_dir . '/autoload/jetpack.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/jetpack.vim --create-dirs  https://raw.githubusercontent.com/tani/vim-jetpack/master/autoload/jetpack.vim'
  autocmd VimEnter * JetpackSync | source $MYVIMRC
endif
call jetpack#begin()
Jetpack 'vim-jp/vimdoc-ja'
Jetpack 'markonm/traces.vim'
Jetpack 'itchyny/lightline.vim'
Jetpack 'hallzy/lightline-iceberg'
Jetpack 'preservim/nerdtree'
Jetpack 'jistr/vim-nerdtree-tabs'
Jetpack 'ryanoasis/vim-devicons'
Jetpack 'mengelbrecht/lightline-bufferline'
Jetpack 'Yggdroot/indentLine'
Jetpack 'vim-skk/skkeleton'
call jetpack#end()

command Jetpack JetpackSync

" NERDTree
" command Tree NERDTree
let NERDTreeShowHidden=1

" NERDTree-Tabs
command Tree NERDTreeTabsToggle
let g:nerdtree_tabs_open_on_console_startup=1

" color
if empty(glob(data_dir . '/colors/iceberg.vim'))
  silent execute '!curl -fLo '.data_dir.'/colors/iceberg.vim --create-dirs https://raw.githubusercontent.com/cocopon/iceberg.vim/master/colors/iceberg.vim'
endif
set background=dark
colorscheme iceberg

" フォルダアイコンの表示をON
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" lightline
let g:lightline = {
      \ 'colorscheme': 'iceberg',
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
      \ 'active': {
        \ 'left': [
          \ ['mode', 'paste'],
          \ ['readonly', 'filename', 'modified'],
          \ ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok']
          \ ]
          \ }
          \ }

" lightline
let g:lightline.component_expand = {
      \   'linter_checking': 'lightline#ale#checking',
      \   'linter_warnings': 'lightline#ale#warnings',
      \   'linter_errors': 'lightline#ale#errors',
      \   'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \   'linter_checking': 'left',
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \   'linter_ok': 'left',
      \ }
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_infos = "\uf129"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"

" lightline-bufferline
if has('gui_running')
  set guioptions-=e
endif

let g:lightline.tab = {
      \ 'active': [ 'tabnum', 'filename', 'modified' ],
      \ 'inactive': [ 'tabnum', 'filename', 'modified' ]
      \ }

" indentLine
let g:indentLine_enabled = 1
let g:indentLine_char = '|'

" skkeleton
imap jk <Plug>(skkeleton-toggle)
cmap jk <Plug>(skkeleton-toggle)
inoremap <silent><expr> <Esc>  skkeleton#is_enabled() ? '<Plug>(skkeleton-disable)' : '<Esc>'
call skkeleton#config({
      \ 'eggLikeNewline': v:true,
      \ 'globalJisyo': '~/.skk/SKK-JISYO.L',
      \ 'registerConvertResult': v:true
      \})
