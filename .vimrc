let mapleader = " "

"map config -----------------------------------------------------------

"inoremap <leader>w <Esc>:w<cr>
noremap <leader>w :w<cr>

noremap <C-e> <End>
inoremap <C-e> <End>


" Super fast window movement shortcuts
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

" general config ---------------------------------------------------------

" 主题
set background=light
colorscheme PaperColor

" 语法高亮
syntax on

" 字符长度限制 TODO 分文件
let &colorcolumn=join(range(121,121),",")

" 高亮查找匹配
set hlsearch

" 显示行号
set nu

" 高亮所在行
set cursorline
highlight cursorline cterm=NONE
" highlight LineNr ctermbg=NONE
highlight SignColumn ctermbg=NONE

" 开启文件类型侦测
filetype on         
" 根据侦测到的不同类型加载对应的插件
filetype plugin on  

" 根据文件类型设置缩进
autocmd filetype javascript,vue,html,css,xml set sw=2
autocmd filetype javascript,vue,html,css,xml set ts=2
autocmd filetype javascript,vue,html,css,xml set sts=2


"tab indents by 4 sapces
set softtabstop =4
set shiftwidth  =4       " >> indents by 4 spaces.
set shiftround             " >> indents to next multiple of 'shiftwidth'.



" 代码折叠
set foldmethod=indent
set foldlevel=99


"不需要备份
set nobackup

"没有保存或文件只读时弹出确认
set confirm


"鼠标可用
set mouse=a

"c文件自动缩进
set cindent

"根据前一行进行缩进
set autoindent

"use spaces instead of tabs
set expandtab

set backspace   =indent,eol,start

" 无需保存即可在缓冲区中切换
set hidden


" 尽可能多的显示最后一行
set laststatus=2
set noshowmode
set showcmd

"智能缩进
set smartindent


"共享剪切板
set clipboard=unnamed

"文件自动检测外部更改
set autoread

"高亮查找匹配
set hlsearch
set incsearch

" buffer
" 切换前后buffer
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>

" autocmd ----------------------------------------------------------------

" plugged config ---------------------------------------------------------

"ale config
let g:ale_sign_column_always = 1
let g:ale_linters = {
\   'php': ['phpcs'],
\}
let g:ale_fixers = {
\   'php': ['phpcbf'],
\   'javascript': ['eslint'],
\   'vue': ['eslint'],
\   'html': ['eslint'],
\}
let g:ale_php_phpcs_standard = 'PSR1,PSR2'
let g:ale_php_phpcbf_standard = 'PSR1,PSR2'
let g:ale_php_phpcs_use_global = 1

let g:ale_fix_on_save = 1
"let g:ale_sign_error = '✗'
let g:ale_sign_error = '😫'
let g:ale_sign_warning = '⚡️'
let g:ale_set_highlights = 0
highlight clear ALEErrorSign
highlight clear ALEWarningSign



"lightline config
let g:lightline = {
\ 'colorscheme': 'custom_light',
\ 'active': {
\   'left': [['mode', 'paste'], ['filename', 'modified']],
\   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
\ },
\ 'component_expand': {
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\   'linter_ok': 'LightlineLinterOK'
\ },
\ 'component_type': {
\   'readonly': 'error',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error'
\ },
\ }


function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ⚡️', all_non_errors)
endfunction
function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d 😫', all_errors)
endfunction
function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? ' 😆 ' : ''
endfunction

" Update and show lightline but only if it's visible (e.g., not in Goyo)
autocmd User ALELintPost call lightline#update()




" NERDTree config
map <silent> <C-n> :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1
let NERDTreeShowHiddle=1

" CtrlP config
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
nmap <leader><leader> :CtrlPBuffer<CR>
let g:ctrlp_prompt_mappings = {
    \ 'PrtHistory(-1)':       ['<c-n>'],
    \ 'PrtHistory(1)':        ['<c-p>'],
    \ 'AcceptSelection("e")': ['<cr>', '<c-o>', '<2-LeftMouse>'],
    \  'PrtExpandDir()':       ['<tab>'],
    \ 'PrtCurStart()':        ['<c-a>'],
    \ 'PrtCurEnd()':          ['<c-e>'],
    \ 'PrtCurLeft()':         ['<c-h>', '<left>', '<c-^>'],
    \ 'PrtCurRight()':        ['<c-l>', '<right>'],
    \ 'PrtClearCache()':      ['<c-r>'],
    \ }
let g:ctrlp_extensions = ['funky']

" ctrlp-funky config
nnoremap <Leader>f :CtrlPFunky<Cr>
let g:ctrlp_funky_syntax_highlight = 1

" vim-javascript
let g:javascript_plugin_jsdoc = 1


" vim-snack config 
let g:sneak#label = 1
"map f <Plug>Sneak_f
"map F <Plug>Sneak_F
"map t <Plug>Sneak_t
"map T <Plug>Sneak_T

                
" nerdcommenter config
let g:NERDSpaceDelims=1 " 在注释的后面添加一个空格
nnoremap <leader>cc <plug>NERDCommenterToggle
vnoremap <leader>cc <plug>NERDCommenterToggle

" emmet config
let g:user_emmet_mode='i'
let g:user_emmet_expandabbr_key = '<c-f>'


" vue config
autocmd FileType vue syntax sync fromstart


" YouCompleteMe config
let g:ycm_global_ycm_extra_conf='~/.vim/configs/.ycm_extra_conf.py'

let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
" let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
set completeopt=menu,menuone

noremap <c-z> <NOP>

" let g:ycm_semantic_triggers =  {
" 			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
" 			\ 'cs,lua,javascript': ['re!\w{2}'],
" 			\ }


" Bbye config
nnoremap <leader>q :Bdelete<CR>


" vim-gutentags config
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" " 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" " 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags, 'p')
endif





call plug#begin('~/.vim/plugged')

" Plug 'ludovicchabant/vim-gutentags'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'pangloss/vim-javascript'
Plug 'Valloric/YouCompleteMe'
Plug 'marijnh/tern_for_vim'
Plug 'Raimondi/delimitMate'
Plug 'itchyny/lightline.vim'
Plug 'mattn/emmet-vim', { 'for': ['vue', 'html']}
Plug 'justinmk/vim-sneak'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdcommenter'
Plug 'posva/vim-vue'
Plug 'moll/vim-bbye'
Plug 'NLKNguyen/papercolor-theme'

Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plug 'tpope/vim-commentary'

call plug#end()

