" -- General Settings --
filetype plugin indent on     " Enable file type detection and do language-dependent indenting
syntax enable                 " Enable syntax highlighting
set number                    " Show line numbers
set relativenumber            " Show relative line numbers
set expandtab                 " Use spaces instead of tabs
set tabstop=2                 " Number of spaces that a <Tab> counts for
set shiftwidth=2              " Number of spaces to use for each step of (auto)indent
set softtabstop=2             " Number of spaces that a <Tab> counts for while performing editing operations
set autoindent                " Copy indent from current line when starting a new line
set smartindent               " Do smart autoindenting when starting a new line
set hidden                    " Allow buffer switching without saving
set incsearch                 " Show search matches as you type
set ignorecase                " Ignore case when searching
set smartcase                 " Override ignorecase if search pattern contains upper case letters
set clipboard=unnamed         " Use system clipboard
set backspace=indent,eol,start " Make backspace work as you would expect
set cursorline                " Highlight current line
set wildmenu                  " Enhanced command line completion
set wildmode=list:longest,full " Complete files like a shell

" Disable swap files and backups
set noswapfile
set nobackup
set nowritebackup

" -- Key Mappings --
let mapleader = "\<Space>"    " Set leader key to space
nnoremap <leader>w :w<CR>     " Quick save
nnoremap <leader>q :q<CR>     " Quick quit

" Clear search highlight with Escape key
nnoremap <silent> <Esc> :noh<CR><Esc>

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" -- Plugins --
" Load vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
  " Provides a start screen with recent files, bookmarks, etc.
  Plug 'mhinz/vim-startify'

  " AI assistance
  Plug 'github/copilot.vim'

  " Elixir support
  " Usage: Provides syntax highlighting and indentation for Elixir files
  " Commands: None (works automatically)
  Plug 'elixir-editors/vim-elixir'

  " Usage: Automatically formats Elixir code
  " Commands: :MixFormat to format the current file
  Plug 'mhinz/vim-mix-format'

  " Linting and formatting
  " Usage: Provides linting and fixing for various languages
  " Commands: :ALEFix to fix issues, :ALELint to check for issues
  Plug 'dense-analysis/ale'

  " Autocomplete and language server
  " Usage: Provides autocompletion and language server features
  " Commands: Various, see :help coc-commands
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Usage: Elixir language server for CoC
  " Commands: None (works with CoC automatically)
  Plug 'amiralies/coc-elixir', {'do': 'yarn install && yarn prepack'}

  " Testing
  " Usage: Provides commands to run tests
  " Commands: :TestNearest, :TestFile, :TestSuite, :TestLast, :TestVisit
  Plug 'vim-test/vim-test'

  " Usage: Provides a terminal for running tests and commands
  " Commands: :T {command} to run a command in the terminal
  Plug 'kassio/neoterm'

  " File explorer
  " Usage: Provides a file explorer sidebar
  " Commands: :NERDTreeToggle to open/close, :NERDTreeFind to locate current file
  Plug 'preservim/nerdtree'

  " Fuzzy finder
  " Usage: Provides fuzzy finding for files, buffers, etc.
  " Commands: :Files, :Buffers, :Ag, etc.
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " Git UI
  " Usage: Provides a TUI for Git
  " Commands: :LazyGit
  Plug 'kdheepak/lazygit.nvim'

  " A git commit browser
  " Usage: Provides a Git commit browser
  " Commands: :GV
  Plug 'junegunn/gv.vim'

  " GitHub integration
  " Usage: Provides GitHub integration
  " Commands: :Gbrowse, :Gbrowse! to open the current file on GitHub
  Plug 'tpope/vim-rhubarb'

  " Usage: Shows git diff in the sign column
  " Commands: ]c and [c to navigate changes, <leader>hp to preview
  Plug 'airblade/vim-gitgutter'

  " Status line
  " Usage: Enhances the status line with more information
  " Commands: None (works automatically)
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " Commenting plugin
  " Usage: Provides commands to comment/uncomment code
  " Commands: gcc to toggle comment for a line, gc for visual selection
  Plug 'tpope/vim-commentary'

  " Erlang support
  " Usage: Provides syntax highlighting and indentation for Erlang
  " Commands: None (works automatically)
  Plug 'vim-erlang/vim-erlang-runtime'
  Plug 'vim-erlang/vim-erlang-compiler'
  Plug 'vim-erlang/vim-erlang-omnicomplete'

  " Rust support
  " Usage: Provides Rust file detection, syntax highlighting, formatting, etc.
  " Commands: :RustFmt to format, :RustRun to run, :RustTest to test
  Plug 'rust-lang/rust.vim'

  " Gleam support
  " Usage: Provides syntax highlighting for Gleam
  " Commands: None (works automatically)
  Plug 'gleam-lang/gleam.vim'

  " Python support
  " Usage: Provides enhanced Python syntax highlighting
  " Commands: None (works automatically)
  Plug 'vim-python/python-syntax'

  " Usage: Provides better Python indentation
  " Commands: None (works automatically)
  Plug 'Vimjas/vim-python-pep8-indent'

  " Lisp support
  " Usage: Provides Lisp editing environment
  " Commands: ,e to evaluate expression, ,d to evaluate defun, etc.
  Plug 'kovisoft/slimv'

  " Language Server Protocol (LSP) support
  " Usage: Provides LSP client support
  " Commands: :LspStatus, :LspDefinition, :LspReferences, etc.
  Plug 'prabirshrestha/vim-lsp'

  " Usage: Provides automatic LSP server installation
  " Commands: :LspInstallServer
  Plug 'mattn/vim-lsp-settings'

  " One Dark theme
  Plug 'joshdick/onedark.vim'

  " Installs airline themes
  Plug 'vim-airline/vim-airline-themes'

  " File icons
  Plug 'ryanoasis/vim-devicons'
call plug#end()

" -- Plugin Configuration --
" ALE
let g:ale_fixers = {
  \ 'elixir': ['mix_format'],
  \ 'python': ['black']
  \ }
let g:ale_fix_on_save = 1

" Startify configuration

" Function to center ASCII art
function! CenterAsciiArt(lines)
    let longest_line = max(map(copy(a:lines), 'strwidth(v:val)'))
    let centered_lines = map(copy(a:lines), 'repeat(" ", (&columns - strwidth(v:val)) / 2) . v:val')
    return centered_lines
endfunction

" Startify custom header with centered Assassin's Creed logo ASCII art
let s:ascii_art = [
      \ '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
      \ '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
      \ '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
      \ '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⠋⢿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
      \ '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⡏⠀⠘⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
      \ '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⡿⠀⠀⠀⠹⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
      \ '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⠃⠀⠀⠀⠀⢹⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀',
      \ '⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⠇⠀⠀⠀⠀⠀⠀⢻⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀',
      \ '⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⡟⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀',
      \ '⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀',
      \ '⠀⠀⠀⠀⠀⠀⣠⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣷⣄⠀⠀⠀⠀⠀',
      \ '⠈⣶⣦⣤⣶⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⣿⣿⣷⣶⣾⠇',
      \ '⠀⢻⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿⠀',
      \ '⠀⣼⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⣿⣿⠀',
      \ '⠀⠛⠻⢿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⡿⠟⠛⠃',
      \ '⠀⠀⠀⠀⠙⠿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⡿⠋⠀⠀⠀⠀',
      \ '⠀⠀⠑⠄⡀⠀⠈⠙⠳⢦⣀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡠⠶⠋⠁⠀⢀⡠⠊⠀⠀',
      \ '⠀⠀⠀⠀⠈⠒⢤⣀⠀⠀⠀⠁⠀⠀⣠⣄⠀⠀⠀⠀⠀⠀⣀⡤⠒⠁⠀⠀⠀⠀',
      \ '⠀⠀⠀⠀⠀⠀⠀⠈⠉⠛⠷⠶⢶⣿⣿⣿⣿⡷⠶⠾⠛⠋⠁⠀⠀⠀⠀⠀⠀⠀',
      \ '',
      \ 'A S S A S S I N '' S   C R E E D',
      \ '',
      \ '[ Nothing is true, everything is permitted ]',
      \ '',
      \ 'Welcome to Vim, Assassin!'
      \ ]

let g:startify_custom_header = CenterAsciiArt(s:ascii_art)

" Function to limit list items to 5
function! LimitedList(type, cmd, header)
    return { 'type': a:type, 'header': a:header, 'command': a:cmd . ' | head -n5' }
endfunction

" Startify lists limited to 5 items each
let g:startify_lists = [
      \ LimitedList('files',     'find . -type f -not -path "*/\.*" | sed "s|^./||"', ['   Recent Files']),
      \ LimitedList('dir',       'find . -mindepth 1 -maxdepth 1 -type d | sed "s|^./||"', ['   Current Directory '. getcwd()]),
      \ LimitedList('sessions',  'ls -1 ~/.vim/session', ['   Sessions']),
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']           },
      \ ]

" Minimal left padding
let g:startify_padding_left = 3

" Bookmarks (limited to 5)
let g:startify_bookmarks = [
      \ { 'c': '~/.config/nvim/init.vim' },
      \ { 'p': '~/Projects' },
      \ ]

" Automatically update sessions
let g:startify_session_persistence = 1

" Change to VCS root directory
let g:startify_change_to_vcs_root = 1

" Custom footer
let g:startify_custom_footer = CenterAsciiArt(['We Work in the Dark to Serve the Light.'])

" Use custom indices for a cleaner look
let g:startify_custom_indices = map(range(1,100), 'string(v:val)')

" Adjust the entry format for better alignment
function! StartifyEntryFormat()
    return 'StartifyEntryPadding() . substitute(entry_path, "\\s*$", "", "")'
endfunction

" Function to add minimal padding to entries
function! StartifyEntryPadding()
    return repeat(' ', g:startify_padding_left)
endfunction

" Highlight settings
highlight StartifyHeader  ctermfg=114 guifg=#87d787
highlight StartifyPath    ctermfg=245 guifg=#8a8a8a
highlight StartifyFile    ctermfg=255 guifg=#eeeeee
highlight StartifySlash   ctermfg=240 guifg=#585858

" Enable custom colors for the Assassin's Creed logo
autocmd VimEnter * call matchadd('StartifyHeader', '\%1l\_.*\%29l')

" Adjust header format to align with list items
let g:startify_custom_header_quotes = [
      \ map(['Recent Files', 'Current Directory '.getcwd(), 'Sessions', 'Bookmarks'],
      \ '"   ".v:val')
      \ ]

" Limit the number of files shown in each list
let g:startify_files_number = 5
let g:startify_session_number = 5

" GitHub Copilot settings
let g:copilot_enabled = 1

" rhubarb
nnoremap <leader>gh :.GBrowse<CR>

" CoC
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> <leader>co  :<C-u>CocList outline<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" vim-test
let test#strategy = "neoterm"
let g:neoterm_default_mod = 'botright'
let g:neoterm_size = '20'
let g:neoterm_autoscroll = 1

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>

" Lazygit
nnoremap <silent> <leader>gg :LazyGit<CR>
let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 0.9 " scaling factor for floating window
let g:lazygit_floating_window_border_chars= ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_use_neovim_remote = 1 " fallback to 0 if neovim-remote is not installed

" FZF
nnoremap <C-p> :Files<CR>
nnoremap <leader>b :Buffers<CR>

" -- Theme Configuration --
set background=dark
if (has("termguicolors"))
  set termguicolors
endif

" Enable the One Dark colorscheme
syntax on
colorscheme onedark

" Italic comments
highlight Comment cterm=italic

" Airline theme
let g:airline_theme='onedark'

" -- Language-specific settings --

" Elixir
autocmd FileType elixir setlocal commentstring=#\ %s
autocmd FileType elixir setlocal shiftwidth=2 tabstop=2 softtabstop=2
let g:mix_format_on_save = 1

" Erlang
autocmd BufRead,BufNewFile *.erl,*.hrl setfiletype erlang
let g:erlang_show_errors = 1

" Rust
let g:rustfmt_autosave = 1
autocmd FileType rust setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" Gleam
autocmd BufRead,BufNewFile *.gleam setfiletype gleam
autocmd FileType gleam setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" Python
let g:python_highlight_all = 1
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType python setlocal autoindent fileformat=unix

" Lisp
let g:slimv_swank_cmd = '! xterm -e sbcl --load ~/.vim/slime/start-swank.lisp &'
autocmd FileType lisp setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" LSP configuration
if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'allowlist': ['python'],
        \ })
endif

if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        \ 'workspace_config': {'rust': {'clippy_preference': 'on'}},
        \ 'allowlist': ['rust'],
        \ })
endif

" Key mappings for LSP
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=green guibg=green
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Add a shortcut to copy the current file path
nnoremap <leader>cp :let @+=expand("%:p")<CR>

" Configure CoC for Elixir
let g:coc_global_extensions = ['coc-elixir']

" -- Language-specific Shortcuts --

" Add a mapping for quick Elixir documentation lookup
nnoremap <silent> <leader>k :call CocActionAsync('doHover')<CR>

" Elixir
nnoremap <leader>md :!mix dialyzer<CR>
nnoremap <leader>mc :!mix credo<CR>
nnoremap <leader>mcs :!mix credo --strict<CR>
nnoremap <leader>mu :!mix deps.get<CR>
nnoremap <leader>mc :!mix compile<CR>
nnoremap <leader>mx :call RunCustomMixTask()<CR>
nnoremap <leader>ms :call SwitchTestImplementation()<CR>
nnoremap <leader>mf :!mix format %<CR>
nnoremap <leader>mi :terminal iex -S mix<CR>

function! RunCustomMixTask()
  let task = input('Enter mix task: ')
  if !empty(task)
    execute '!mix ' . task
  endif
endfunction

function! SwitchTestImplementation()
  let current_file = expand('%')
  if current_file =~ '_test\.exs$'
    let target_file = substitute(current_file, '/test/', '/lib/', '')
    let target_file = substitute(target_file, '_test\.exs$', '.ex', '')
  elseif current_file =~ '\.ex$'
    let target_file = substitute(current_file, '/lib/', '/test/', '')
    let target_file = substitute(target_file, '\.ex$', '_test.exs', '')
  else
    echo "Not in a recognized Elixir file"
    return
  endif
  if filereadable(target_file)
    execute 'edit ' . target_file
  else
    echo "Target file not found: " . target_file
  endif
endfunction

" Erlang
nnoremap <leader>ec :!erlc %<CR>
nnoremap <leader>er :!erl -noshell -s $(basename % .erl) start -s init stop<CR>

" Rust
nnoremap <leader>rr :RustRun<CR>
nnoremap <leader>rt :RustTest<CR>

" Gleam
nnoremap <leader>gr :!gleam run<CR>
nnoremap <leader>gt :!gleam test<CR>

" Python
nnoremap <leader>pr :!python %<CR>

" Lisp
nnoremap <leader>le :Eval<CR>
nnoremap <leader>lc :Call<CR>
