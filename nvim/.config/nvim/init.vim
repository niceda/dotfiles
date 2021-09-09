" __  ____   __  _   ___     _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|

" Author: @Fida

" ===
" === Auto load for first time uses
" ===
" Install vim-plug if not found
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif
" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endifu



" ===
" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
" ===
let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
	let has_machine_specific_file = 0
	silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
source $XDG_CONFIG_HOME/nvim/_machine_specific.vim


" ====================
" === Editor Setup ===
" ====================
" ===
" === System
" ===
"set clipboard=unnamedplus
let &t_ut=''
set autochdir


" ===
" === Editor behavior
" ===
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set exrc
set secure
set number
set relativenumber
set cursorline
set hidden
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set list
set listchars=tab:\|\ ,trail:▫
set scrolloff=18
set sidescroll=18
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set showcmd
set wildmenu
set ignorecase
set smartcase
set shortmess+=c
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set re=0
set visualbell
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
"silent !mkdir -p ~/.config/nvim/tmp/sessions
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.
endif
set colorcolumn=100
" set cursorcolumn
set updatetime=100
set virtualedit=block

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" ===
" === Terminal Behaviors
" ===
" let g:neoterm_autoscroll = 1
" autocmd TermOpen term://* startinsert
" tnoremap <C-N> <C-\><C-N>
" tnoremap <C-O> <C-\><C-N><C-O>
" let g:terminal_color_0  = '#000000'
" let g:terminal_color_1  = '#FF5555'
" let g:terminal_color_2  = '#50FA7B'
" let g:terminal_color_3  = '#F1FA8C'
" let g:terminal_color_4  = '#BD93F9'
" let g:terminal_color_5  = '#FF79C6'
" let g:terminal_color_6  = '#8BE9FD'
" let g:terminal_color_7  = '#BFBFBF'
" let g:terminal_color_8  = '#4D4D4D'
" let g:terminal_color_9  = '#FF6E67'
" let g:terminal_color_10 = '#5AF78E'
" let g:terminal_color_11 = '#F4F99D'
" let g:terminal_color_12 = '#CAA9FA'
" let g:terminal_color_13 = '#FF92D0'
" let g:terminal_color_14 = '#9AEDFE'


" ===
" === Basic Mappings
" ===
" Set <LEADER> as ,
let mapleader=","

" Save & quit
noremap <space>q :q!<CR>

" Open the vimrc file anytime
noremap <LEADER>ev :e ~/.config/nvim/init.vim<CR>

" make Y to copy till the end of the line
nnoremap Y y$

" Copy to system clipboard
vnoremap y "+y

" Indentation
" nnoremap < <<
" nnoremap > >>

" Search
" noremap <space><CR> :nohlsearch<CR>
noremap <space>h :nohlsearch<CR>

" >SEE
" Adjacent duplicate words
" noremap <LEADER>dw /\(\<\w\+\>\)\_s*\1

" Space to Tab
" nnoremap <space>tt :%s/    /\t/g
" vnoremap <space>tt :s/    /\t/g

" noremap <silent> \v v$h

" ===
" === Searching
" ===
" >SEE
" noremap n nzzzv
" noremap N Nzzzv
nnoremap n nzz
nnoremap N Nzz


" noremap J mzJ`z

" ===
" === Undo break points
" ===
" inoremap , ,<c-g>u
" inoremap . .<c-g>u
" inoremap ! !<c-g>u
" inoremap ? ?<c-g>u

" Jumplist mutations
" nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
" nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" move line / block
" vnoremap <A-j> :m '>+1<CR>gv=gv
" vnoremap <A-k> :m '<-2<CR>gv=gv
" inoremap <A-j> <esc>:m .+1<CR>==a
" inoremap <A-k> <esc>:m .-2<CR>==a
" nnoremap <A-j> :m .+1<CR>==
" nnoremap <A-k> :m .-2<cR>==

" Spelling Check with <space>sc
" noremap <LEADER>sc :set spell!<CR>

" Press ` to change case (instead of ~)
" noremap ` ~

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h

" find and replace
noremap \s :%s//g<left><left>

" set wrap
" noremap <LEADER>sw :set wrap<CR>

" >SEE
" press f10 to show hlgroup
function! SynGroup()
	let l:s = synID(line('.'), col('.'), 1)
	echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
map <F10> :call SynGroup()<CR>

" Compile function
noremap <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
		set splitbelow
		:sp
		:res -5
		term javac % && time java %<
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "InstantMarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
		silent! exec "CocCommand flutter.dev.openDevLog"
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc

" ===
" === Install Plugins with Vim-Plug
" ===

call plug#begin('~/.config/nvim/plugged')

" Treesitter
" Plug 'nvim-treesitter/nvim-treesitter'
" Plug 'nvim-treesitter/playground'

" Pretty Dress
Plug 'theniceboy/nvim-deus'
" Plug 'ajmwagar/vim-deus'
" Plug 'ackyshake/Spacegray.vim'

" Status line
Plug 'theniceboy/eleline.vim'
Plug 'ojroques/vim-scrollstatus'

" General Highlighter
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'RRethy/vim-illuminate'

" lsp
Plug 'neovim/nvim-lspconfig'

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'


" File navigation
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'airblade/vim-rooter'
Plug 'pechorin/any-jump.vim'

" Taglist
Plug 'liuchengxu/vista.vim'

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'wellle/tmux-complete.vim'

" Snippets
" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Undo Tree
Plug 'mbbill/undotree'

" Git
Plug 'theniceboy/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
Plug 'fszymanski/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }
"Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'
Plug 'cohama/agit.vim'
Plug 'kdheepak/lazygit.nvim' 

" Autoformat
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'

" Editor Enhancement
" Plug 'matze/vim-move'
" Plug 'junegunn/vim-easy-align'
" Plug 'AndrewRadev/splitjoin.vim'
" Plug 'theniceboy/antovim' " gs to switch
" Plug 'tpope/vim-capslock'	" Ctrl+L (insert) to toggle capslock
" Plug 'junegunn/vim-after-object' " da= to delete what's after = >SEE
" Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all t|ext in '', or type i) i] i} ip
Plug 'jiangmiao/auto-pairs'
Plug 'mg979/vim-visual-multi'
Plug 'tomtom/tcomment_vim'
Plug 'rhysd/clever-f.vim'
Plug 'Yggdroot/indentLine'
Plug 'svermeulen/vim-subversive'
Plug 'tpope/vim-surround' " type ysiw' to wrap the word with '' or type cs'` to change 'word' to `word`

" Find & Replace
Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }

" Mini Vim-APP
Plug 'skywind3000/asynctasks.vim' " >SEE
Plug 'skywind3000/asyncrun.vim'   " >SEE

" Other visual enhancement
Plug 'luochen1990/rainbow'
Plug 'mg979/vim-xtabline'
Plug 'ryanoasis/vim-devicons'
Plug 'wincent/terminus'

" Other useful utilities
Plug 'lambdalisue/suda.vim' " do stuff like :sudowrite

call plug#end()


" ===
" === Dress up my vim
" ===
set termguicolors " enable true colors support
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1 " >SEE
"set background=dark
"let ayucolor="mirage"
"let g:oceanic_next_terminal_bold = 1
"let g:oceanic_next_terminal_italic = 1
"let g:one_allow_italics = 1

" color dracula
color deus
" color gruvbox
" color spacegray
" set background=light

" spacegray
" let g:spacegray_underline_search = 1
let g:spacegray_use_italics = 1
" let g:spacegray_low_contrast = 1

" >SEE
hi NonText ctermfg=gray guifg=grey10 " eol extends precedes
" hi SpecialKey ctermfg=blue guifg=grey70 " tab trail nbsp

" Make vim trasparent
" hi Normal guibg=NONE ctermbg=NONE " transparent bg

" ===================== Start of Plugin Settings =====================

" ===
" === nvim-treesitter
" ===
lua <<EOF
-- require'nvim-treesitter.configs'.setup {
--   ensure_installed = {"typescript", "dart", "java"},     -- one of "all", "language", or a list of languages
--   highlight = {
--     enable = true,              -- false will disable the whole extension
--     disable = { "c", "rust" },  -- list of language that will be disabled
--   },
-- }
EOF

" ===
" === eleline.vim
" ===
let g:airline_powerline_fonts = 0


" ==
" == GitGutter
" ==
" let g:gitgutter_signs = 0
let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '░'
let g:gitgutter_sign_removed = '▏'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_modified_removed = '▒'
autocmd BufWritePost * GitGutter
nnoremap <space>gf :GitGutterFold<CR>
nnoremap <space>gp :GitGutterPreviewHunk<CR>
nnoremap <space>gk :GitGutterPrevHunk<CR>
nnoremap <space>gj :GitGutterNextHunk<CR>


" ===
" === coc.nvim
" ===
let g:coc_global_extensions = [
	\ 'coc-css',
	\ 'coc-diagnostic',
	\ 'coc-eslint',
	\ 'coc-explorer',
  \ 'coc-gitignore',
	\ 'coc-html',
	\ 'coc-json',
	\ 'coc-lists',
	\ 'coc-prettier',
	\ 'coc-prisma',
	\ 'coc-pyright',
	\ 'coc-python',
	\ 'coc-snippets',
	\ 'coc-sourcekit',
	\ 'coc-stylelint',
	\ 'coc-syntax',
	\ 'coc-tailwindcss',
	\ 'coc-tasks',
	\ 'coc-translator',
	\ 'coc-tslint-plugin',
	\ 'coc-tsserver',
	\ 'coc-vetur',
	\ 'coc-vimlsp',
	\ 'coc-yaml',
	\ 'coc-emmet',
	\ 'coc-yank']
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" >SEE
" inoremap <silent><expr> <c-space> coc#refresh()
" inoremap <silent><expr> <c-o> coc#refresh()

" Mappings for CoCList >SEE
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
" nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR> >SEE
" Do default action for previous item.
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR> >SEE
" Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" nnoremap <c-c> :CocCommand<CR> "
" Text Objects
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
" Useful commands
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD :tab sp<CR><Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
noremap <space>e :CocCommand explorer<CR>
" coc-translator
nmap ts <Plug>(coc-translator-p)
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>aw  <Plug>(coc-codeaction-selected)w
" coc-tasks
" noremap <silent> <leader>ts :CocList tasks<CR>
" coc-snippets 
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
imap <C-j> <Plug>(coc-snippets-expand-jump)
let g:snips_author = 'fida'
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc




" ===
" === lsp
" ===
lua << EOF
-- require'lspconfig'.pyright.setup{}
-- require'lspconfig'.ccls.setup{}
EOF


" ===
" === telescope
" ===
" Find files using Telescope command-line sugar.
" nnoremap <space>ff <cmd>Telescope find_files<cr>
" nnoremap <space>fg <cmd>Telescope live_grep<cr>
" nnoremap <space>fb <cmd>Telescope buffers<cr>
" nnoremap <space>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <space>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <space>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <space>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <space>fh <cmd>lua require('telescope.builtin').help_tags()<cr>


" ===
" === FZF
" ===
set rtp+=/usr/local/opt/fzf
set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf
set rtp+=/home/fida/.linuxbrew/opt/fzf
" >SEE
nnoremap <silent> <c-p> :Leaderf file<CR>
nnoremap <silent> <C-f> :Rg<CR>
noremap <silent> <C-h> :History<CR>
" noremap <leader>; :History:<CR>
" noremap <leader>h :History:<CR>

let g:fzf_preview_window = 'right:60%'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" noremap <c-d> :BD<CR>  " >SEE
command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))
function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction
function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction


" ===
" === Leaderf
" ===
" let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_PreviewCode = 1
let g:Lf_ShowHidden = 1
let g:Lf_ShowDevIcons = 1
" >SEE
let g:Lf_CommandMap = {
\   '<C-]>': ['<C-v>'],
\   '<C-j>': ['<C-n>'],
\   '<C-k>': ['<C-p>'],
\}
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
let g:Lf_WildIgnore = {
        \ 'dir': ['.git', 'vendor', 'node_modules'],
        \ 'file': ['__vim_project_root']
        \}
let g:Lf_UseMemoryCache = 0
let g:Lf_UseCache = 0

" ===
" === Undotree
" ===
" noremap L :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24

" ===
" === vim-visual-multi >SEE: function map
" ===
"let g:VM_theme             = 'iceblue'
"let g:VM_default_mappings = 0
let g:VM_leader                     = {'default': ',', 'visual': ',', 'buffer': ','}
let g:VM_maps                       = {}
let g:VM_maps["Undo"]               = 'u'
let g:VM_maps["Redo"]               = '<C-r>'


" ===
" === Far.vim
" ===
" noremap <LEADER>f :F  **/*<left><left><left><left><left>
" let g:far#mapping = {
" 		\ "replace_undo" : ["l"],
" 		\ }

" ===
" === Vista.vim
" ===
nnoremap <LEADER>v :Vista!!<CR>
" noremap <c-t> :silent! Vista finder coc<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:60%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

" ===
" === fzf-gitignore
" ===
" noremap <LEADER>gi :FzfGitignore<CR>


" ===
" === AutoFormat
" ===
augroup autoformat_settings
	" autocmd FileType bzl AutoFormatBuffer buildifier
	" autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
	" autocmd FileType dart AutoFormatBuffer dartfmt
	" autocmd FileType go AutoFormatBuffer gofmt
	" autocmd FileType gn AutoFormatBuffer gn
	" autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
	autocmd FileType java AutoFormatBuffer google-java-format
	" autocmd FileType python AutoFormatBuffer yapf
	" Alternative: autocmd FileType python AutoFormatBuffer autopep8
	" autocmd FileType rust AutoFormatBuffer rustfmt
	" autocmd FileType vue AutoFormatBuffer prettier
augroup END

" ===
" === vim-after-object
" ===
" hava bug >SEE
autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')


" ===
" === rainbow
" ===
let g:rainbow_active = 1


" ===
" === xtabline
" ===
let g:xtabline_settings = {}
let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
let g:xtabline_settings.enable_persistance = 0
let g:xtabline_settings.last_open_first = 1

" ===
" === suda.vim
" ===
" cnoreabbrev sudowrite w suda://%
cnoreabbrev sw w suda://%


" ===
" === vim-surround
" ===
let g:surround_no_insert_mappings = 1

" ===
" === vim-subversive
" ===
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)



" ===
" === vim-illuminate
" ===
let g:Illuminate_delay = 750
hi illuminatedWord cterm=undercurl gui=undercurl
" hi link illuminatedWord CursorLine


" ===
" === vim-rooter
" ===
let g:rooter_patterns = ['__vim_project_root', '.git/']
let g:rooter_silent_chdir = 1


" ===
" === AsyncRun
" ===
" noremap gp :AsyncRun git push<CR>


" ===
" === AsyncTasks
" ===
let g:asyncrun_open = 6

" ===
" === tcomment_vim
" ===
let g:tcomment_textobject_inlinecomment = ''

" ===
" === any-jump
" ===
" nnoremap j :AnyJump<CR>
let g:any_jump_disable_default_keybindings = 1
let g:any_jump_window_width_ratio  = 0.8
let g:any_jump_window_height_ratio = 0.9

" ===
" === Agit
" ===
" nnoremap <LEADER>gl :Agit<CR>
let g:agit_no_default_mappings = 1

" ===
" === lazygit.nvim
" ===
noremap <space>gg :LazyGit<CR>
let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 1.0 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_use_neovim_remote = 1 " for neovim-remote support


" ===================== End of Plugin Settings =====================


" ===
" === Necessary Commands to Execute
" ===
exec "nohlsearch"


" Open the _machine_specific.vim file if it has just been created
if has_machine_specific_file == 0
	exec "e ~/.config/nvim/_machine_specific.vim"
endif
