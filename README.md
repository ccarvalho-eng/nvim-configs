# Neovim Configuration

<img width="1237" alt="Screenshot 2024-10-02 at 1 26 43 AM" src="https://github.com/user-attachments/assets/6254373f-7121-43f6-823d-75bda73cace1">

## Table of Contents
1. [Installation](#installation)
2. [General Settings](#general-settings)
3. [Key Mappings](#key-mappings)
4. [Plugins](#plugins)
5. [Theme Configuration](#theme-configuration)
6. [Language-specific Settings](#language-specific-settings)
7. [Custom Functions](#custom-functions)
8. [Additional Features](#additional-features)

## Installation

1. Install Neovim (version 0.5 or later recommended):
   - On macOS: `brew install neovim`
   - On Ubuntu: `sudo apt install neovim`
   - For other systems, refer to the [official Neovim installation guide](https://github.com/neovim/neovim/wiki/Installing-Neovim)

2. Clone this repository to your Neovim config directory:
   ```
   git clone https://github.com/yourusername/neovim-config.git ~/.config/nvim
   ```

3. Install vim-plug (plugin manager):
   ```
   sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
          https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
   ```

4. Install plugins:
   - Open Neovim: `nvim`
   - Run the command: `:PlugInstall`
   - Restart Neovim after installation is complete

5. Install language servers and linters:
   - For Elixir: `mix local.hex && mix archive.install hex credo`
   - For Rust: `rustup component add rls rust-analysis rust-src`
   - For Python: `pip install python-language-server`

## General Settings

The configuration includes several general settings to improve the editing experience:

- Line numbers (`set number`) and relative line numbers (`set relativenumber`) are enabled for easy navigation
- Tabs are converted to spaces (`set expandtab`) with a default of 2 spaces (`set tabstop=2 shiftwidth=2 softtabstop=2`)
- Search is case-insensitive (`set ignorecase`) unless capital letters are used (`set smartcase`)
- Swap files and backups are disabled (`set noswapfile`, `set nobackup`, `set nowritebackup`) to avoid clutter
- System clipboard is used (`set clipboard=unnamed`) for easy copy-pasting between Neovim and other applications
- Auto-indentation (`set autoindent`) and smart indentation (`set smartindent`) are enabled
- Hidden buffers are allowed (`set hidden`) for easier buffer management
- Incremental search (`set incsearch`) shows matches as you type
- Command-line completion is enhanced (`set wildmenu`, `set wildmode=list:longest,full`)

## Key Mappings

The configuration includes several custom key mappings to improve workflow:

- Leader key is set to space (`let mapleader = "\<Space>"`)
- `<leader>w`: Quick save
- `<leader>q`: Quick quit
- `<C-h/j/k/l>`: Navigate between windows (replaces the need for `<C-w>` prefix)
- `<leader>cp`: Copy the current file path to clipboard
- `<leader>r`: Toggle between number and relativenumber
- `<Esc>`: Clear search highlighting

These mappings are designed to speed up common operations and reduce the need for mode switching.

## Plugins

The configuration uses several plugins to enhance functionality. Here's a detailed breakdown of key plugins:

### Startify
- Provides a custom start screen with recently edited files, sessions, and bookmarks
- Customized with an Assassin's Creed theme
- Access by running `:Startify` or automatically when opening Neovim without a file

### NERDTree
- File explorer for easy navigation of project structure
- Toggle NERDTree: `<leader>n`
- Find current file in NERDTree: `<leader>f`

### FZF (Fuzzy Finder)
- Rapidly search for files, buffers, and more
- Find files: `<C-p>`
- List buffers: `<leader>b`

### ALE (Asynchronous Lint Engine)
- Provides linting and formatting for various languages
- Configured to fix issues on save for supported languages

### CoC (Conquer of Completion)
- Provides autocompletion, code navigation, and language server features
- Go to definition: `gd`
- Find references: `gr`
- Show documentation: `K`
- List outline: `<leader>co`

### vim-test
- Run tests directly from Neovim
- Run nearest test: `<leader>t`
- Run file tests: `<leader>T`
- Run all tests: `<leader>a`
- Run last test: `<leader>l`
- Visit last test file: `<leader>g`

### LazyGit
- Integrated Git interface
- Open LazyGit: `<leader>gg`

### vim-gitgutter
- Shows git diff in the sign column
- Navigate changes: `]c` (next change), `[c` (previous change)

### vim-commentary
- Easily comment/uncomment code
- Toggle comment: `gcc`
- Comment visual selection: `gc`

For a complete list of installed plugins and their descriptions, please refer to the [Plugin List](#plugin-list) section.

## Theme Configuration

The configuration uses the One Dark theme for a pleasant and readable color scheme:

- One Dark theme is enabled (`colorscheme onedark`)
- True color is enabled if supported (`set termguicolors`)
- Italic comments are enabled for better readability
- Airline theme is set to One Dark for a consistent look

To customize the theme further, you can modify the colorscheme settings in the configuration file.

## Language-specific Settings

The configuration includes optimized settings for several programming languages:

### Elixir
- Format on save enabled (`let g:mix_format_on_save = 1`)
- Comment string set to `#`
- Shortcuts:
  - `<leader>md`: Run dialyzer
  - `<leader>mc`: Run credo
  - `<leader>mcs`: Run credo (strict)
  - `<leader>mu`: Update dependencies
  - `<leader>mc`: Compile
  - `<leader>mx`: Run custom mix task (prompts for task name)
  - `<leader>ms`: Switch between test and implementation files
  - `<leader>mf`: Format current file
  - `<leader>mi`: Start IEx console
- Debug function shortcut: `<leader>d`

### Erlang
- Error highlighting enabled (`let g:erlang_show_errors = 1`)
- Shortcuts:
  - `<leader>ec`: Compile current file
  - `<leader>er`: Run current file

### Rust
- Format on save enabled (`let g:rustfmt_autosave = 1`)
- Shortcuts:
  - `<leader>rr`: Run Rust file
  - `<leader>rt`: Run Rust tests

### Gleam
- Syntax highlighting and indentation settings
- Shortcuts:
  - `<leader>gr`: Run Gleam project
  - `<leader>gt`: Run Gleam tests

### Python
- Enhanced syntax highlighting enabled (`let g:python_highlight_all = 1`)
- PEP 8 indentation enforced
- Shortcut:
  - `<leader>pr`: Run Python file

### Lisp
- SLIMV (Superior Lisp Interaction Mode for Vim) configured
- Shortcuts:
  - `<leader>le`: Evaluate expression
  - `<leader>lc`: Call function

## Custom Functions

The configuration includes several custom functions to enhance workflow:

- `RunCustomMixTask()`: Prompts for a Mix task name and runs it
- `SwitchTestImplementation()`: Switches between test and implementation files for Elixir
  - If in a test file, switches to the corresponding implementation file
  - If in an implementation file, switches to the corresponding test file
- `ToggleNumber()`: Toggles between `number` and `relativenumber` settings

## Additional Features

- Automatic sourcing of Vimrc file on save
- Highlight trailing whitespace
- Language Server Protocol (LSP) configuration for various languages
- GitHub Copilot integration for AI-assisted coding
- Custom status line with Airline
- Goyo and Limelight for distraction-free writing
- Undotree for visualizing and navigating undo history
- Multiple cursor support for simultaneous editing
- EasyMotion for improved navigation within files
- VimWiki for personal note-taking and organization

## Plugin List

This configuration includes a wide array of plugins to enhance various aspects of the Neovim experience. Here's a complete list of installed plugins with links to their GitHub repositories:

1. [mhinz/vim-startify](https://github.com/mhinz/vim-startify)
2. [github/copilot.vim](https://github.com/github/copilot.vim)
3. [elixir-editors/vim-elixir](https://github.com/elixir-editors/vim-elixir)
4. [dense-analysis/ale](https://github.com/dense-analysis/ale)
5. [neoclide/coc.nvim](https://github.com/neoclide/coc.nvim)
6. [amiralies/coc-elixir](https://github.com/amiralies/coc-elixir)
7. [vim-test/vim-test](https://github.com/vim-test/vim-test)
8. [kassio/neoterm](https://github.com/kassio/neoterm)
9. [preservim/nerdtree](https://github.com/preservim/nerdtree)
10. [junegunn/fzf](https://github.com/junegunn/fzf)
11. [junegunn/fzf.vim](https://github.com/junegunn/fzf.vim)
12. [kdheepak/lazygit.nvim](https://github.com/kdheepak/lazygit.nvim)
13. [junegunn/gv.vim](https://github.com/junegunn/gv.vim)
14. [tope/vim-fugitive](https://github.com/tpope/vim-fugitive)
15. [tpope/vim-rhubarb](https://github.com/tpope/vim-rhubarb)
16. [airblade/vim-gitgutter](https://github.com/airblade/vim-gitgutter)
17. [vim-airline/vim-airline](https://github.com/vim-airline/vim-airline)
18. [vim-airline/vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)
19. [tpope/vim-commentary](https://github.com/tpope/vim-commentary)
20. [vim-erlang/vim-erlang-runtime](https://github.com/vim-erlang/vim-erlang-runtime)
21. [vim-erlang/vim-erlang-compiler](https://github.com/vim-erlang/vim-erlang-compiler)
22. [vim-erlang/vim-erlang-omnicomplete](https://github.com/vim-erlang/vim-erlang-omnicomplete)
23. [rust-lang/rust.vim](https://github.com/rust-lang/rust.vim)
24. [gleam-lang/gleam.vim](https://github.com/gleam-lang/gleam.vim)
25. [vim-python/python-syntax](https://github.com/vim-python/python-syntax)
26. [Vimjas/vim-python-pep8-indent](https://github.com/Vimjas/vim-python-pep8-indent)
27. [kovisoft/slimv](https://github.com/kovisoft/slimv)
28. [prabirshrestha/vim-lsp](https://github.com/prabirshrestha/vim-lsp)
29. [mattn/vim-lsp-settings](https://github.com/mattn/vim-lsp-settings)
30. [joshdick/onedark.vim](https://github.com/joshdick/onedark.vim)
31. [ryanoasis/vim-devicons](https://github.com/ryanoasis/vim-devicons)
32. [tpope/vim-surround](https://github.com/tpope/vim-surround)
33. [tpope/vim-repeat](https://github.com/tpope/vim-repeat)
34. [jiangmiao/auto-pairs](https://github.com/jiangmiao/auto-pairs)
35. [alvan/vim-closetag](https://github.com/alvan/vim-closetag)
36. [easymotion/vim-easymotion](https://github.com/easymotion/vim-easymotion)
37. [terryma/vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)
38. [mbbill/undotree](https://github.com/mbbill/undotree)
39. [vimwiki/vimwiki](https://github.com/vimwiki/vimwiki)
40. [junegunn/goyo.vim](https://github.com/junegunn/goyo.vim)
41. [junegunn/limelight.vim](https://github.com/junegunn/limelight.vim)
