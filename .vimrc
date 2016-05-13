"vi 互換ではなくVim のデフォルト設定にする
set nocompatible
" 環境設定系
" シンタックスハイライト
syntax on
" エンコード
set encoding=utf8
" ファイルエンコード
set fileencoding=utf-8
" スクロールする時に下が見えるようにする
set scrolloff=5
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
set clipboard+=unnamed
set clipboard=unnamed
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
set matchtime=3
" ウィンドウの幅より長い行は折り返され、次の行に続けて表示される
set wrap
" 入力されているテキストの最大幅を無効にする
set textwidth=0
" 不可視文字を表示
set listchars=tab:≫-,trail:-,extends:≫,precedes:≪,nbsp:%,eol:$
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
" 小文字の検索でも大文字も見つかるようにする
set ignorecase
" ただし大文字も含めた検索の場合はその通りに検索する
set smartcase
" インクリメンタルサーチを行う
set incsearch
" 検索結果をハイライト表示
:set hlsearch
" コマンド、検索パターンを10000個まで履歴に残す
set history=10000
" <F11>でpaste, nopasteを切り替え
set pastetoggle=<F11>
" bufferが変更されているとき，エラーでなく，保存するかを確認
set confirm

set cursorline    " タイプ中のコマンドを表示

" indent
set showcmd
set expandtab     " タブ入力を複数の空白入力に置き換える
set tabstop=2     " 画面上でタブ文字が占める幅
set shiftwidth=2  " 自動インデントでずれる幅
set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent    " 改行時に前の行のインデントを継続
set smartindent   " 改行時に入力された行の末尾に合わせて次の行のインデントを増減

" w!! でスーパーユーザーとして保存（sudoが使える環境限定）
cmap w!! w !sudo tee > /dev/null %
" 入力モード中に素早くJJと入力した場合はESCとみなす
inoremap jj <Esc>
inoremap { {}<left>
inoremap [ []<left>
inoremap ( ()<left>
inoremap " ""<left>
inoremap ' ''<left>
inoremap < <><left>

set visualbell

"plugin----------------------------------------------------------------

filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'MaxMEllon/molokai'
"htmlのシンタックスファイル
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'taichouchou2/html5.vim'
"JSのシンタックスファイル
NeoBundle 'mattn/jscomplete-vim'

NeoBundle 'Yggdroot/indentLine'
let g:indentLine_faster = 1
nmap <silent><Leader>i :<C-u>IndentLinesToggle<CR>
let g:indentLine_color_term = 111
let g:indentLine_color_gui = '#708090'
let g:indentLine_char = '¦'

NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tpope/vim-fugitive'
let g:lightline = {
      \ 'colorscheme': 'default',
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

" 色の設定(syntax onのあと) molokai
set t_Co=256
try
  colorscheme molokai
  let g:molokai_original = 1
catch
  colorscheme desert
endtry

