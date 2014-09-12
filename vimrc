"========================================================================
"   FileName: .vimrc
"     Author: Lijun.Wang
"      Email: wljcom@163.com
"   HomePage: http://www.wlj.com
" LastChange: 2012-10-21 14:34:31
"========================================================================

au BufNewFile,BufRead *.html setf htmldjango

colorscheme elflord          " 着色模式  torte  
set guifont=Monaco:h10       " 字体 && 字号
set tabstop=4                " 设置tab键的宽度
set shiftwidth=4             " 换行时行间交错使用4个空格
set autoindent               " 自动对齐
" set backspace=2              " 设置退格键可用
set backspace=start,indent,eol

set cindent shiftwidth=4     " 自动缩进4空格
set smartindent              " 智能自动缩进
set ai!                      " 设置自动缩进
set nu!                      " 显示行号
set showmatch               " 显示括号配对情况

set mouse=a                  " 启用鼠标
"set selection=exclusive
"set selectmode=mouse,key

set ruler                    " 右下角显示光标位置的状态行

set incsearch                " 开启实时搜索功能
set hlsearch                 " 开启高亮显示结果
"set nowrapscan               " 搜索到文件两端时不重新搜索
set ignorecase               " 搜索忽略大小写

set nocompatible             " 关闭兼容模式
set vb t_vb=                 " 关闭提示音
""set cursorline              " 突出显示当前行
set hidden                   " 允许在有未保存的修改时切换缓冲区
"set list                     " 显示Tab符，使用一高亮竖线代替
"set listchars=tab:\|\ ,

set autoread                 " 当文件改变时自动读取
syntax enable                " 打开语法高亮
syntax on                    " 开启文件类型侦测
filetype indent on           " 针对不同的文件类型采用不同的缩进格式
filetype plugin on           " 针对不同的文件类型加载对应的插件
filetype plugin indent on    " 启用自动补全

set writebackup              " 设置无备份文件
set nobackup
set noswapfile

"set noeb                     " 去掉输入错误的提示声音
set nowb
set noerrorbells   "去掉错误提示音
set novisualbell   "去掉显示提示音

set autochdir                " 设定文件浏览器目录为当前目录
set nowrap                   " 设置不自动换行 set wrap
set foldmethod=syntax        " 选择代码折叠类型
set foldlevel=100            " 禁止自动折叠

"set laststatus=2             " 开启状态栏信息
"set cmdheight=2              " 命令行的高度，默认为1，这里设为2

" 每行超过80个的字符用下划线标示
""au BufRead,BufNewFile *.s,*.asm,*.h,*.c,*.cpp,*.cc,*.java,*.cs,*.erl,*.hs,*.sh,*.lua,*.pl,*.pm,*.php,*.py,*.rb,*.erb,*.vim,*.js,*.css,*.xml,*.html,*.xhtml 2match Underlined /.\%81v/

" 设置编码
set fenc=utf-8
set encoding=utf-8
set fileencodings=utf-8,gbk,cp936,latin-1
set helplang=cn
"////////////////////////////////////////////////////
"set fileencodings=ucs-bom,utf-8,cp936
set expandtab   "用空格代替制表符
"set noexpandtab  " 不要用空格代替制表符



" For Haskell
:let hs_highlight_delimiters=1            " 高亮定界符
:let hs_highlight_boolean=1               " 把True和False识别为关键字
:let hs_highlight_types=1                 " 把基本类型的名字识别为关键字
:let hs_highlight_more_types=1            " 把更多常用类型识别为关键字
:let hs_highlight_debug=1                 " 高亮调试函数的名字
:let hs_allow_hash_operator=1             " 阻止把#高亮为错误


" ======= 引号 && 括号自动匹配 ======= "

:inoremap ( ()<ESC>i

:inoremap ) <c-r>=ClosePair(')')<CR>

:inoremap { {}<ESC>i

:inoremap } <c-r>=ClosePair('}')<CR>

:inoremap [ []<ESC>i

:inoremap ] <c-r>=ClosePair(']')<CR>

:inoremap " ""<ESC>i

:inoremap ' ''<ESC>i

:inoremap ` ``<ESC>i

function ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
       return "\<Right>"
    else
       return a:char
    endif
endf



" :Tlist              调用TagList
let Tlist_Show_One_File=1                    " 只显示当前文件的tags
let Tlist_Exit_OnlyWindow=1                  " 如果Taglist窗口是最后一个窗口则退出Vim
let Tlist_Use_Right_Window=1                 " 在右侧窗口中显示
let Tlist_File_Fold_Auto_Close=1             " 自动折叠

" TxtBrowser          高亮TXT文本文件
au BufRead,BufNewFile *.txt setlocal ft=txt


" :LoadTemplate       根据文件后缀自动加载模板
let g:template_path='~/.vim/template/'


" :AuthorInfoDetect   自动添加作者、时间等信息，本质是NERD_commenter && authorinfo的结合
let g:vimrc_author='Lijun.Wang'
let g:vimrc_email='wljcom@163.com'
let g:vimrc_homepage='http://www.wlj.com'

" nt                  打开NERDTree [非插入模式]
" map nt :NERDTree<CR>

" tl                  打开Taglist [非插入模式]
" map tl :Tlist<CR><c-l>

"生成tag文件,喜欢的时候就按一下F8
map <F8> :!ctags -R --fields=+lS <CR> 

" Ctrl + E            一步加载语法模板和作者、时间信息
map <c-e> <ESC>:LoadTemplate<CR><ESC>:AuthorInfoDetect<CR><ESC>Gi
imap <c-e> <ESC>:LoadTemplate<CR><ESC>:AuthorInfoDetect<CR><ESC>Gi
vmap <c-e> <ESC>:LoadTemplate<CR><ESC>:AuthorInfoDetect<CR><ESC>Gi


" Ctrl + H            将光标移到当前行的行首
"imap <c-h> <ESC>I
" Ctrl + J            将光标移到下一行的行首
"imap <c-j> <ESC>jI
" Ctrl + K            将光标移到上一行的末尾
"imap <c-k> <ESC>kA
" Ctrl + L            将光标移到当前行的行尾
"imap <c-l> <ESC>A


" jj                  保存文件并留在插入模式 [插入模式]
imap jj <ESC>:w<CR>li

" kk                  返回Normal模式 [插入模式]
imap kk <ESC>l









