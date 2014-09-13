"========================================================================
"   FileName: .vimrc
"     Author: Lijun.Wang
"      Email: wljcom@163.com
"   HomePage: http://www.wlj.com
"========================================================================

au BufNewFile,BufRead *.html setf htmldjango

colorscheme elflord          " 着色模式  torte desert elflord
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
set showmatch                " 显示括号配对情况

"set mouse=a                  " 启用鼠标
"set selection=exclusive
"set selectmode=mouse,key

set history=100              " 历史命令保存行数

set ruler                    " 右下角显示光标位置的状态行

set incsearch                " 开启实时搜索功能
set hlsearch                 " 开启高亮显示结果
"set nowrapscan               " 搜索到文件两端时不重新搜索
set ignorecase               " 搜索忽略大小写

set nocompatible             " 关闭兼容模式
set vb t_vb=                 " 关闭提示音
"set cursorline              " 突出显示当前行
set hidden                   " 允许在有未保存的修改时切换缓冲区
"set list                     " 显示Tab符，使用一高亮竖线代替
"set listchars=tab:\|\ ,

" vim-pathogen
" execute pathogen#infect()
call pathogen#infect()

set autoread                 " 当文件改变时自动读取
syntax enable                " 打开语法高亮
syntax on                    " 开启文件类型侦测
filetype indent on           " 针对不同的文件类型采用不同的缩进格式
filetype plugin on           " 针对不同的文件类型加载对应的插件
filetype plugin indent on    " 启用自动补全

"set writebackup              " 设置无备份文件
set nowb
set nobackup
set noswapfile

"set noeb                     " 去掉输入错误的提示声音
set nowb                      "不覆盖文件前建立备份
set noerrorbells              "去掉错误提示音
set novisualbell              "去掉显示提示音

set autochdir                " 设定文件浏览器目录为当前目录
set nowrap                   " 设置不自动换行 set wrap
set foldmethod=syntax        " 选择代码折叠类型
set foldlevel=100            " 禁止自动折叠

set laststatus=2             " 开启状态栏信息
set cmdheight=2              " 命令行的高度，默认为1，这里设为2
"set showcmd                  " 状态栏显示当前执行的命令

"set paste                    " 粘贴时保持格式

" 每行超过80个的字符用下划线标示
"au BufRead,BufNewFile *.s,*.asm,*.h,*.c,*.cpp,*.cc,*.java,*.cs,*.erl,*.hs,*.sh,*.lua,*.pl,*.pm,*.php,*.py,*.rb,*.erb,*.vim,*.js,*.css,*.xml,*.html,*.xhtml 2match Underlined /.\%81v/

" 设定默认解码
set fenc=utf-8
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,gbk,cp936,latin-1,ucs-bom
set helplang=cn
"////////////////////////////////////////////////////
set expandtab   "用空格代替制表符
"set noexpandtab  " 不要用空格代替制表符

" :LoadTemplate       根据文件后缀自动加载模板
let g:template_path='~/.vim/template/'


"====================================================================================================
"  < ctags 工具配置 >
"====================================================================================================
" 对浏览代码非常的方便,可以在函数,变量之间跳转等
set tags=./tags;                            "向上级目录递归查找tags文件（好像只有在Windows下才有用）
"生成tag文件,喜欢的时候就按一下F8
map <F12> :!ctags -R --fields=+lS <CR> 
"ctags -R --c-kinds=+px --fields=+iaS --extra=+q
"ctags -R --c++-kinds=+px --fields=+iaS --extra=+q
"ctags -R --languages=c,c++
"ctags -R --languages=c,c++ --langmap=c:+.h
"要加入系统函数或全局变量的tag标签
"ctags -I __THROW –file-scope=yes –langmap=c:+.h –languages=c,c++ –links=yes –c-kinds=+p --fields=+S -R -f 

"====================================================================================================
"  < TagList 工具配置 >
"====================================================================================================
" :Tlist              调用TagList
let Tlist_Show_One_File=1                    " 只显示当前文件的tags
let Tlist_Exit_OnlyWindow=1                  " 如果Taglist窗口是最后一个窗口则退出Vim
let Tlist_Use_Right_Window=1                 " 在右侧窗口中显示
let Tlist_File_Fold_Auto_Close=1             " 自动折叠
"let Tlist_Auto_Open = 1                      " 启动vim后自动打开taglist窗口

"设置taglist窗口大小
"let Tlist_WinHeight = 100
let Tlist_WinWidth = 36
 
"设置taglist打开关闭的快捷键F8
noremap <F10> :TlistToggle<CR>

" tl                  打开Taglist [非插入模式]
"map tl :Tlist<CR><c-l> 

"====================================================================================================
"  < 打开NERDTree 工具配置 >
"====================================================================================================
" nt                  打开NERDTree [非插入模式]
" map nt :NERDTree<CR>
noremap <F9> :NERDTree<CR>

"====================================================================================================
"  < cscope 工具配置 >
"====================================================================================================
" 用Cscope自己的话说 - "你可以把它当做是超过频的ctags"
if has("cscope")
    " 关闭autocscope插件的快捷健映射.防止和我们定义的快捷键冲突
    "let g:autocscope_menus=0  
    "设定可以使用 quickfix 窗口来查看 cscope 结果
    set cscopequickfix=s-,c-,d-,i-,t-,e-
    "使支持用 Ctrl+]  和 Ctrl+t 快捷键在代码间跳转
    set cscopetag
	"cscope的查找结果在格式上最多显示6层目录.
	set cspc=6 
    "如果你想反向搜索顺序设置为1
    set csto=0
	
	set cst
	
    "在当前目录中添加任何数据库
    if filereadable("cs.out")
        cs add cs.out
    "否则添加数据库环境中所指出的
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set cscopeverbose
    "快捷键设置
    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
	nmap <C-n>  :cnext<CR>
    nmap <C-p>  :cprev<CR>
endif

