call plug#begin('~/.local/share/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jlanzarotta/bufexplorer'
Plug 'wakatime/vim-wakatime'
Plug 'vimwiki/vimwiki'
Plug 'rakr/vim-one'
"=== Plug 'neoclide/coc.nvim', {'branch': 'release'}
"=== Plug 'scrooloose/nerdcommenter'
"=== Plug 'sbdchd/neoformat'
"=== Plug 'neomake/neomake'
"=== Plug 'machakann/vim-highlightedyank'
"=== Plug 'tmhedberg/SimpylFold'
"=== Plug 'morhetz/gruvbox'
"=== Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"=== Plug 'junegunn/fzf.vim'
"=== Plug 'elixir-editors/vim-elixir'
"=== Plug 'mattn/emmet-vim'
"=== Plug 'terryma/vim-multiple-cursors'
"=== Plug 'posva/vim-vue'
"=== Plug 'prettier/vim-prettier', {
"===   \ 'do': 'npm install',
"===   \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
"=== Plug 'tpope/vim-fugitive'
"=== Plug 'tpope/vim-surround'
"=== Plug 'tpope/vim-repeat'
"=== Plug 'airblade/vim-gitgutter'
"=== Plug 'HerringtonDarkholme/yats.vim'
"=== " Plug 'Quramy/tsuquyomi'
"=== Plug 'easymotion/vim-easymotion'
"=== Plug 'rbgrouleff/bclose.vim'
"=== Plug 'francoiscabrol/ranger.vim'
"=== Plug 'andymass/vim-matchup'
"=== Plug 'nathanaelkane/vim-indent-guides'
"=== Plug 'luochen1990/rainbow'

call plug#end()
let g:airline_theme='one'

colorscheme one
set background=dark " for the dark version
" set background=light " for the light version

" Misc settings
set number relativenumber " Show line numbers
set ruler " Show line and column numbers of the cursor.
set background=dark
set termguicolors
set tabstop=8
set expandtab
set shiftwidth=4
set autoindent
set smartindent
set smartcase
syntax on

" leader key
let mapleader="\<space>"


" === Misc === "

nnoremap <Leader>, :BufExplorer<CR>

"=== " Quickly edit/reload this configuration file
"=== nnoremap <Leader>ev :e $MYVIMRC<CR>
"=== nnoremap <Leader>rv :so $MYVIMRC<CR>

"=== " Keymappings for tabswitching
"=== nnoremap H gT
"=== nnoremap L gt

"=== " Fix broken syntax highlight
"=== nnoremap <Leader>fh :syntax sync fromstart<CR>

"=== " autoload rainbow parentheses
"=== let g:rainbow_active = 1

"=== " Autoreload when saving init.vim/vimrc
"=== if has ('autocmd') " Remain compatible with earlier versions
"===  augroup vimrc     " Source vim configuration upon save
"===     autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
"===     autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
"===   augroup END
"=== endif " has autocmd

"=== " emmet-binding
"=== let g:user_emmet_leader_key=','

"=== " This allows buffers to be hidden if you've modified a buffer.
"=== " This is almost a must if you wish to use buffers in this way.
"=== set hidden

"=== " To open a new empty buffer
"=== " This replaces :tabnew which I used to bind to this mapping
"=== nmap <leader>T :enew<cr>

"=== " Close the current buffer and move to the previous one
"=== " This replicates the idea of closing a tab
"=== nmap <leader>bq :bp <BAR> bd #<CR>

"=== " Show all open buffers and their status
"=== nmap <leader>bl :ls<CR>

"=== " Quickswap buffers
"=== nmap <c-j> :bnext <cr>
"=== nmap <c-k> :bprev <cr>

"=== " Use hybridnumbers in active buffer but absolute in others
"=== augroup numbertoggle
"===   autocmd!
"===   autocmd BufEnter,FocusGained,WinEnter * if &nu | set rnu   | endif
"===   autocmd BufLeave,FocusLost,WinLeave   * if &nu | set nornu | endif
"=== augroup END

"=== let g:ranger_replace_netrw = 1 " open ranger when vim open a directory
"=== let g:ranger_map_keys = 0
"=== nnoremap <silent><Leader>n :RangerCurrentDirectory<CR>
"=== nnoremap <silent><Leader>N :RangerWorkingDirectory<CR>

"=== " Add space before nerdcommenter comments
"=== let g:NERDSpaceDelims=1

"=== "=== indent guides === "

"=== let g:indent_guides_enable_on_vim_startup = 1
"=== let g:indent_guides_guide_size = 1

"=== "=== Fzf === "

"=== let g:fzf_action = {
"===       \ 'ctrl-s': 'split',
"===       \ 'ctrl-v': 'vsplit'
"===       \ }

"=== nnoremap <c-p> :GFiles<cr>
"=== nnoremap <Leader>p :Files<cr>
"=== nnoremap ; :Buffers<cr>
"=== nmap <Leader>l :BLines<cr>
"=== nmap <Leader>L :Lines<cr>


"=== augroup fzf
"===   autocmd!
"===   autocmd! FileType fzf
"===   autocmd  FileType fzf set laststatus=0 noshowmode noruler
"===     \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
"=== augroup END

"=== "=== Coc.nvim === "

"=== " use <tab> for trigger completion and navigate to next complete item
"=== function! s:check_back_space() abort
"===   let col = col('.') - 1
"===   return !col || getline('.')[col - 1]  =~ '\s'
"=== endfunction

"=== inoremap <silent><expr> <TAB>
"===       \ pumvisible() ? "\<C-n>" :
"===       \ <SID>check_back_space() ? "\<TAB>" :
"===       \ coc#refresh()

"=== "Close preview window when completion is done.
"=== autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

"=== " Remap for rename current word
"=== nmap <leader>lr <Plug>(coc-rename)

"=== " Use K for show documentation in preview window
"=== nnoremap <silent> K :call <SID>show_documentation()<CR>

"=== function! s:show_documentation()
"===   if &filetype == 'vim'
"===     execute 'h '.expand('<cword>')
"===   else
"===     call CocAction('doHover')
"===   endif
"=== endfunction

"=== " === Airline === "

"=== " Enable the list of buffers
"=== let g:airline#extensions#tabline#enabled = 1

"=== " Show just the filename
"=== let g:airline#extensions#tabline#fnamemod = ':t'

"=== " ============================================================================ "
"=== " ===                             KEY MAPPINGS                             === "
"=== " ============================================================================ "

"=== " Quick window switching
"=== nmap <C-h> <C-w>h
"=== nmap <C-j> <C-w>j
"=== nmap <C-k> <C-w>k
"=== nmap <C-l> <C-w>l

"=== " === coc.nvim === "
"=== nmap <silent> <leader>dd <Plug>(coc-definition)
"=== nmap <silent> <leader>dt <Plug>(coc-type-defintion)
"=== nmap <silent> <leader>dr <Plug>(coc-references)
"=== nmap <silent> <leader>di <Plug>(coc-implementation)

"=== " === vim-better-whitespace === "
"=== "   <leader>y - Automatically remove trailing whitespace
"=== nmap <leader>y :StripWhitespace<CR>

"=== " === Search shorcuts === "
"=== "   <leader>h - Find and replace
"=== "   <leader>/ - Claer highlighted search terms while preserving history
"=== map <leader>h :%s///<left><left>
"=== nmap <silent> <leader>/ :nohlsearch<CR>

"=== " === Easy-motion shortcuts ==="
"=== "   <leader>w - Easy-motion highlights first word letters bi-directionally
"=== map <leader>w <Plug>(easymotion-bd-w)

"=== " Allows you to save files you opened without write permissions via sudo
"=== cmap w!! w !sudo tee %

"=== " === vim-jsdoc shortcuts ==="
"=== " Generate jsdoc for function under cursor
"=== nmap <leader>z :JsDoc<CR>

"=== " Delete current visual selection and dump in black hole buffer before pasting
"=== " Used when you want to paste over something without it getting copied to
"=== " Vim's default buffer
"=== vnoremap <leader>p "_dP

"=== " ============================================================================ "
"=== " ===                                VIMWIKI                               === "
"=== " ============================================================================ "

let wiki = {}
let wiki.path = '~/vimwiki/'
let wiki.path_html = '~/vimwiki/docs'
let wiki.template_path = '~/vimwiki/templates'
let wiki.template_default = 'default'
let wiki.template_ext = '.html'
let wiki.index = 'index'
let wiki.ext = '.wiki'
let wiki.nested_syntaxes = {'python': 'python', 'json': 'json', 'golang': 'go', 'js': 'js', 'sh': 'sh'}
let g:vimwiki_list = [wiki]

"let wiki_1 = {}
"let wiki_1.path = '~/vimwiki'
"let wiki_1.ext = '.wiki'
"let wiki_1.auto_toc = 1
" Create posts automatically
"let wiki_1.diary_rel_path = '_posts'
"let g:vimwiki_list = [wiki_1]
"let g:vimwiki_dir_link = 'index'
"let g:vimwiki_use_calendar = 1
