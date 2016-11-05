"set------------------------------------------------------------
"vi 互換ではなくVim のデフォルト設定にする
set nocompatible
" シンタックスハイライト
syntax on
" エンコード
set encoding=utf8
" ファイルエンコード
set fileencoding=utf-8
" スクロールする時に下が見えるようにする
set scrolloff=5
" 行頭と行末の左右移動で行をまたぐ
set whichwrap=b,s,h,l,<,>,[,]
" .swapファイルを作らない
set noswapfile
" バックアップファイルを作らない
set nowritebackup
" バックアップをしない
set nobackup
" バックスペースで各種消せるようにする
set backspace=indent,eol,start
" ビープ音を消す
set vb t_vb=
set novisualbell
" OSのクリップボードを使う
set clipboard=unnamed,autoselect
" 不可視文字を表示
set list
" 行番号を表示
set number
" 行番号を相対表示
set relativenumber
" 右下に表示される行・列の番号を表示する
set ruler
" compatibleオプションをオフにする
set nocompatible
" 移動コマンドを使ったとき、行頭に移動しない
set nostartofline
" 対応括弧に<と>のペアを追加
set matchpairs& matchpairs+=<:>
" 対応括弧をハイライト表示する
set showmatch
" 対応括弧の表示秒数を3秒にする
set matchtime=1
" ウィンドウの幅より長い行は折り返され、次の行に続けて表示される
set wrap
" 入力されているテキストの最大幅を無効にする
set textwidth=0
" 不可視文字を表示
set listchars=tab:≫-,trail:-,extends:≫,precedes:≪,nbsp:%
" インデントをshiftwidthの倍数に丸める
set shiftround
" 補完の際の大文字小文字の区別しない
set infercase
" 文字がない場所にもカーソルを移動できるようにする
" set virtualedit=all
" 変更中のファイルでも、保存しないで他のファイルを表示
set hidden
" 新しく開く代わりにすでに開いてあるバッファを開く
set switchbuf=useopen
" ファイルが外部で変更された際に自動で読込
set autoread
" 小文字の検索でも大文字も見つかるようにする
set ignorecase
" ただし大文字も含めた検索の場合はその通りに検索する
set smartcase
" インクリメンタルサーチを行う
set incsearch
" 検索結果をハイライト表示
set hlsearch
"ESCを二回押すことでハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>
" 検索時に最後まで移動したら最初に戻る
set wrapscan
" コマンド、検索パターンを10000個まで履歴に残す
set history=10000
" <F11>でpaste, nopasteを切り替え
set pastetoggle=<F11>
" bufferが変更されているとき，エラーでなく，保存するかを確認
set confirm
" タイプ中のコマンドを表示
set cursorline
set wildmenu wildmode=list:longest,full
"set mouse=a

set completeopt=menuone
for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
  exec "imap <expr> " . k . " pumvisible() ? '" . k . "' : '" . k . "\<C-X>\<C-P>\<C-N>'"
endfor

autocmd BufRead,BufNewFile *.json setfiletype javascript
"改行時に自動でコメントアウトを挿入しない
augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
augroup END

" indent----
set showcmd
set expandtab     " タブ入力を複数の空白入力に置き換える
set tabstop=2     " 画面上でタブ文字が占める幅
set shiftwidth=2  " 自動インデントでずれる幅
set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent    " 改行時に前の行のインデントを継続
set smartindent   " 改行時に入力された行の末尾に合わせて次の行のインデントを増減

" w!! でスーパーユーザーとして保存（sudoが使える環境限定）
cmap w!! w !sudo tee > /dev/null %

set visualbell

"insert mode-----------------------------------------------------------

" 入力モード中に素早くJJと入力した場合はESCとみなす
inoremap <silent> jj <Esc>
inoremap <silent> <C-j> j
inoremap <silent> <C-l> <right>
inoremap <silent> <C-h> <C-g>u<C-h>
inoremap <silent> <C-d> <DEL>
inoremap <silent> <C-o> <Esc>o

"inoremap { {}<left>
"inoremap [ []<left>
"inoremap ( ()<left>
"inoremap " ""<left>
"inoremap ' ''<left>
"inoremap < <><left>

"plugin----------------------------------------------------------------

filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'MaxMEllon/molokai'
NeoBundle 'cocopon/iceberg.vim'
NeoBundle 'stulzer/heroku-colorscheme'
NeoBundle 'jacoborus/tender'

"行末の半角スペースの可視化
NeoBundle 'bronson/vim-trailing-whitespace'
"html記述の効率化
NeoBundle 'mattn/emmet-vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'osyo-manga/vim-anzu'
NeoBundle 'tmhedberg/matchit'
NeoBundle 't9md/vim-quickhl'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'haya14busa/incsearch.vim'
NeoBundle 'rhysd/accelerated-jk'
NeoBundle 'Townk/vim-autoclose'
"NeoBundle 'itchyny/vim-cursorword'
NeoBundle 'kana/vim-niceblock'
"NeoBundle 'Shougo/neocomplete.vim'
"let g:neocomplete#enable_at_startup = 1
NeoBundle 'osyo-manga/vim-over'

"syntastic----
"NeoBundle 'scrooloose/syntastic'
"let g:syntastic_enable_signs=1
"let g:syntastic_auto_loc_list=2

"htmlのシンタックスファイル
NeoBundle 'hail2u/vim-css3-syntax'
"NeoBundle 'taichouchou2/html5.vim'

"JSのシンタックスファイル
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'slim-template/vim-slim'

NeoBundle 'scrooloose/nerdtree'

"indentLine----
NeoBundle 'Yggdroot/indentLine'
"let g:indentLine_faster = 1
nmap <silent><Leader>i :<C-u>IndentLinesToggle<CR>
let g:indentLine_color_term = 111
let g:indentLine_color_gui = '#708090'
let g:indentLine_char = '¦'

"vim-anzu----
" mapping
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)

"vim-quickhl----
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

" statusline
set statusline=%{anzu#search_status()}

"vim-easy-align----
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" yankround.vim----
"" キーマップ
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
let g:yankround_max_history = 10
"let g:yankround_use_region_hl = 1

"incsearch.vim----
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
nmap n <Plug>(incsearch-nohl)<Plug>(anzu-n-with-echo)
nmap N <Plug>(incsearch-nohl)<Plug>(anzu-N-with-echo)

"accelerated-jk----
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

"lightline----
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tpope/vim-fugitive'
let g:lightline = {
      \ 'colorscheme': 'tender',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \ },
      \ }
function! LightLineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

set laststatus=2
set noshowmode

call neobundle#end()

filetype plugin indent on
NeoBundleCheck

" カラースキーマの設定--------------------------------------------------

filetype indent on
syntax on

set t_Co=256
set background=dark
"set termguicolors
try
  colorscheme tender
catch
  colorscheme desert
endtry

