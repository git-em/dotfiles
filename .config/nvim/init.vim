"=================================================================================
"general
"=================================================================================

syntax on
set ma
set mouse=a
set cursorline
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoread
set nobackup
set nowritebackup
set noswapfile
set nu 
set foldlevelstart=99
set scrolloff=7
"use y and p with the system clipboard
set clipboard=unnamedplus

"==================================================================================
"plugins
"==================================================================================

call plug#begin('~/.config/nvim/autoload/')

"Colour scheme
" My fave colour schemes:
" dracula/dracula-theme, rakr/vim-one, gosukiwi/vim-atom-dark,
" phanviet/vim-monokai-pro rhysd/vim-color-spring-night arzg/vim-colors-xcode
" kyoz/purify 'jonathanfilip/vim-lucius'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}

"Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}

"Language packs
Plug 'sheerun/vim-polyglot'

"Nvim motions
Plug 'phaazon/hop.nvim'

"LSP autocomplete
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

"File browsing
Plug 'nvim-telescope/telescope-file-browser.nvim'

"Native LSP
Plug 'neovim/nvim-lspconfig'

"Buffer navigation
Plug 'vim-airline/vim-airline'
Plug 'nvim-lualine/lualine.nvim'

"Haskell
Plug 'neovimhaskell/haskell-vim'
Plug 'alx741/vim-hindent'

"Go
"Plug 'fatih/vim-go'

"Grammar checking because I can't english
Plug 'rhysd/vim-grammarous'

"Telescope Requirements
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

"Telescope
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

"git diff
Plug 'sindrets/diffview.nvim'

"magit
Plug 'TimUntersberger/neogit'

"debugger
"Plug 'puremourning/vimspector'

"todo comments
Plug 'folke/todo-comments.nvim'

"devicons
Plug 'kyazdani42/nvim-web-devicons'

"fullstack dev
Plug 'pangloss/vim-javascript' "JS support
Plug 'leafgarland/typescript-vim' "TS support
Plug 'maxmellon/vim-jsx-pretty' "JS and JSX syntax
Plug 'jparise/vim-graphql' "GraphQL syntax
Plug 'mattn/emmet-vim'

call plug#end()

"key combos
"==============================================================================

set encoding=UTF-8
let mapleader = " "

"Navigate buffers
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bf :bfirst<CR>
nnoremap <leader>bl :blast<CR>

nnoremap ccd :CocList diagnostics<CR>
"Other
nnoremap <leader><CR> :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>ne :Telescope file_browser<CR>
nnoremap <leader>f :call CocAction('format')<CR>

autocmd StdinReadPre * let s:std
"==============================================================================
" plugin configs
"==============================================================================

let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

" Focus and redistribute split windows
noremap ff :resize 100 <CR> <BAR> :vertical resize 220<CR>
noremap fm <C-w>=

" Highlight the symbol and its references when holding the cursor.
"autocmd CursorHold * silent call CocActionAsync('highlight')

" Buffer navigation
" TODO
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

"****************************************************
"Markdown Preview Recommended Settings
"****************************************************
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1 

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 1 

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

"normal/insert
nnoremap <C-p> :MarkdownPreview

"Telescope
" will find .lua file that exist at runtime
" should be unique
lua require("bashbunni") 
nnoremap <C-_> <cmd>lua require("bashbunni").curr_buf() <cr>
" nnoremap <C-_> :Telescope current_buffer_fuzzy_find sorting_strategy=ascending prompt_position=top <cr> 
" nnoremap <C-_> <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find({sorting_strategy="ascending", prompt_position="top"})<cr>
nnoremap <F4> :lua package.loaded.bashbunni = nil <cr>:source ~/.config/nvim/init.vim <cr> 
nnoremap <leader>sf :Telescope find_files cwd=~/Documents/Hobbies<cr>
