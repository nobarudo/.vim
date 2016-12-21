"set------------------------------------------------------------

" エンコード
set encoding=utf8
" ファイルエンコード
set fileencoding=utf-8
" スクロールする時に下が見えるようにする
set scrolloff=5
" 行頭と行末の左右移動で行をまたぐ
set whichwrap=b,s,<,>,[,]
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
set listchars=tab:--,trail:-,extends:-,precedes:/,nbsp:%
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
"スクリプト実行中に画面を描画しない
set lazyredraw
"高速ターミナル接続
set ttyfast
set completeopt=menuone

" ファイルを開いたときに、以前のカーソル位置を復元する
function! s:RestoreCursorPostion()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup vimrc_restore_cursor_position
  autocmd!
  autocmd BufWinEnter * call s:RestoreCursorPostion()
  autocmd InsertLeave * set nopaste
augroup END

autocmd BufRead,BufNewFile *.json setfiletype javascript
autocmd BufRead,BufNewFile,BufReadPre *.jade set filetype=pug
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

"mapping---------------------------------------------------------------

"insert mode----
" 入力モード中に素早くJJと入力した場合はESCとみなす
inoremap <silent> jj <Esc>
inoremap <silent> <C-j> j
inoremap <silent> <C-l> <right>
inoremap <silent> <C-d> <DEL>
inoremap <silent> <C-o> <Esc>o

"normal mode----
noremap <Space>l $
noremap <Space>h ^
nnoremap <Space><Space> *
nnoremap j  gj
nnoremap gj j
nnoremap k  gk
nnoremap gk k
nnoremap <space>. :<c-u>tabedit $MYVIMRC<CR>

"visual mode----
vnoremap j gj
vnoremap gj j
vnoremap k gk
vnoremap gk k

"plugin----------------------------------------------------------------

call plug#begin('~/.vim/plugged')

Plug 'MaxMEllon/molokai'
Plug 'cocopon/iceberg.vim'
Plug 'stulzer/heroku-colorscheme'
Plug 'nobarudo/tender.vim'
Plug 'w0ng/vim-hybrid'
Plug 'trusktr/seti.vim'
Plug 'xero/blaquemagick.vim'
Plug 'nobarudo/cloudy'

"行末の半角スペースの可視化
Plug 'bronson/vim-trailing-whitespace'
"html記述の効率化
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'tpope/vim-surround'
Plug 'osyo-manga/vim-anzu'
Plug 'tmhedberg/matchit'
Plug 't9md/vim-quickhl'
Plug 'junegunn/vim-easy-align'
Plug 'LeafCage/yankround.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'rhysd/accelerated-jk'
Plug 'Townk/vim-autoclose'
Plug 'kana/vim-niceblock'
Plug 'osyo-manga/vim-over'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'lilydjwg/colorizer'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle'] }
Plug 'tpope/vim-endwise'
Plug 'vim-scripts/ruby-matchit'
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
Plug 'Shougo/neocomplcache'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'nobarudo/sumippet'
Plug 'bkad/CamelCaseMotion'

"syntax----
"htmlのシンタックスファイル
"Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
"Plug 'taichouchou2/html5.vim'

"JSのシンタックスファイル
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'slim-template/vim-slim', { 'for': 'slim' }
Plug 'digitaltoad/vim-pug', { 'for': 'pug' }

let s:plug = {
      \ "plugs": get(g:, 'plugs', {})
      \ }

function! s:plug.is_installed(name)
  return has_key(self.plugs, a:name) ? isdirectory(self.plugs[a:name].dir) : 0
endfunction

"indentLine----
if s:plug.is_installed("indentLine")
  "let g:indentLine_faster = 1
  nmap <silent><Leader>i :<C-u>IndentLinesToggle<CR>
  let g:indentLine_color_term = 111
  let g:indentLine_color_gui = '#708090'
  let g:indentLine_char = '¦'
endif

"vim-anzu----
if s:plug.is_installed("vim-anzu")
  " mapping
  nmap * <Plug>(anzu-star-with-echo)
  nmap # <Plug>(anzu-sharp-with-echo)
endif

"vim-quickhl----
if s:plug.is_installed("vim-quickhl")
  nmap <Space>m <Plug>(quickhl-manual-this)
  xmap <Space>m <Plug>(quickhl-manual-this)
  nmap <Space>M <Plug>(quickhl-manual-reset)
  xmap <Space>M <Plug>(quickhl-manual-reset)
endif

"vim-easy-align----
if s:plug.is_installed("vim-easy-align")
  " Start interactive EasyAlign in visual mode (e.g. vipga)
  xmap ga <Plug>(EasyAlign)
  " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  nmap ga <Plug>(EasyAlign)
endif

" yankround.vim----
"" キーマップ
if s:plug.is_installed("yankround.vim")
  nmap p <Plug>(yankround-p)
  nmap P <Plug>(yankround-P)
  nmap gp <Plug>(yankround-gp)
  nmap gP <Plug>(yankround-gP)
  nmap <C-p> <Plug>(yankround-prev)
  nmap <C-n> <Plug>(yankround-next)
  let g:yankround_max_history = 15
  "let g:yankround_use_region_hl = 1
endif

"incsearch.vim----
if s:plug.is_installed("incsearch.vim")
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
endif

"incsearch-fuzzy.vim----
if s:plug.is_installed("incsearch-fuzzy.vim")
  map z/ <Plug>(incsearch-fuzzy-/)
  map z? <Plug>(incsearch-fuzzy-?)
  map zg/ <Plug>(incsearch-fuzzy-stay)
endif

"accelerated-jk----
if s:plug.is_installed("accelerated-jk")
  nmap j <Plug>(accelerated_jk_gj)
  nmap k <Plug>(accelerated_jk_gk)
endif

"nerdtree----
if s:plug.is_installed("nerdtree")
  nnoremap <silent><Space>n :NERDTreeToggle<CR>
endif

"neocomplcache----
if s:plug.is_installed("neocomplcache")
  " Disable AutoComplPop.
  let g:acp_enableAtStartup = 0
  " Use neocomplcache.
  let g:neocomplcache_enable_at_startup = 1
  " Use smartcase.
  let g:neocomplcache_enable_smart_case = 1
  " Set minimum syntax keyword length.
  let g:neocomplcache_min_syntax_length = 1
  let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

  " Define dictionary.
  let g:neocomplcache_dictionary_filetype_lists = {
      \ 'default' : ''
      \ }

  " Plugin key-mappings.
  inoremap <expr><C-g>     neocomplcache#undo_completion()
  inoremap <expr><C-l>     neocomplcache#complete_common_string()

  " Recommended key-mappings.
  " <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    return neocomplcache#smart_close_popup() . "\<CR>"
  endfunction
  " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
  inoremap <expr><C-y>  neocomplcache#close_popup()
  inoremap <expr><C-e>  neocomplcache#cancel_popup()
endif

"snippets----
if s:plug.is_installed("neosnippet")
  "plugin key-mappings.
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)

  " SuperTab like snippets behavior.
  imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#expandable_or_jumpable() ?  "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

  " For conceal markers.
  if has('conceal')
    set conceallevel=2 concealcursor=i
  endif

  let g:neosnippet#snippets_directory='~/.vim/snippets'
endif

"CamelCaseMotion----
if s:plug.is_installed("CamelCaseMotion")
  map <silent> w <Plug>CamelCaseMotion_w
  map <silent> b <Plug>CamelCaseMotion_b
  map <silent> e <Plug>CamelCaseMotion_e
  map <silent> ge <Plug>CamelCaseMotion_ge
  sunmap w
  sunmap b
  sunmap e
  sunmap ge
endif

"lightline----
"Plug 'tpope/vim-fugitive'
let g:lightline = {
      \ 'colorscheme': 'tender',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ }
function! LightLineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

set laststatus=2
set noshowmode

call plug#end()

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
