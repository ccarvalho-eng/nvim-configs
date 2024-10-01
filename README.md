# Neovim Configuration README

## Table of Contents
1. [Introduction](#introduction)
2. [Installation](#installation)
3. [General Settings](#general-settings)
4. [Key Mappings](#key-mappings)
5. [Plugins](#plugins)
6. [Theme Configuration](#theme-configuration)
7. [Language-specific Settings](#language-specific-settings)
8. [Custom Functions](#custom-functions)
9. [Additional Features](#additional-features)
10. [Troubleshooting](#troubleshooting)

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

These mappings are designed to speed up common operations and reduce the need for mode switching.

## Plugins

The configuration uses several plugins to enhance functionality. Here's a detailed breakdown of each plugin and how to use it:

### Startify
- Provides a custom start screen with recently edited files, sessions, and bookmarks
- Customized with an Assassin's Creed theme
- Access by running `:Startify` or automatically when opening Neovim without a file
- Navigate using j/k and press Enter to open a file or session

### NERDTree
- File explorer for easy navigation of project structure
- Toggle NERDTree: `<leader>n`
- Find current file in NERDTree: `<leader>f`
- Use j/k to navigate, o to open/close directories, s to open file in a split

### FZF (Fuzzy Finder)
- Rapidly search for files, buffers, and more
- Find files: `<C-p>`
- List buffers: `<leader>b`
- Use Ctrl-j/k to navigate results, Enter to open, Ctrl-t/v/x to open in tab/vertical split/horizontal split

### ALE (Asynchronous Lint Engine)
- Provides linting and formatting for various languages
- Fix issues: `:ALEFix`
- Check for issues: `:ALELint`
- Navigate between errors: `]d` (next error), `[d` (previous error)

### CoC (Conquer of Completion)
- Provides autocompletion, code navigation, and language server features
- Go to definition: `gd`
- Find references: `gr`
- Show documentation: `K`
- List outline: `<leader>co`
- Use Tab to navigate completion menu, Enter to confirm

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
- Navigate using vim motions, ? for help

### vim-gitgutter
- Shows git diff in the sign column
- Navigate changes: `]c` (next change), `[c` (previous change)
- Preview hunk: `<leader>hp`
- Stage hunk: `<leader>hs`
- Undo hunk: `<leader>hu`

### vim-commentary
- Easily comment/uncomment code
- Toggle comment: `gcc`
- Comment visual selection: `gc`

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
