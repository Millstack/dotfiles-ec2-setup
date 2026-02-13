" --- Appearance ---
syntax on                                 " Enable syntax highlighting
set number                                " Show line numbers on the left
set cursorline                            " Highlight the current line for better visibility
set termguicolors                         " Enables True Color support for Vim to use the full 24-bit color range (16 million colors)

" --- Indentation (Cloud Standard: 4 Spaces) ---
set tabstop=4                             " Number of spaces a tab counts for
set shiftwidth=4                          " Number of spaces for auto-indent
set expandtab                             " Convert tabs to spaces (Essential for YAML/CloudFormation)
set autoindent                            " Copy indent from current line when starting a new one

" --- Behavior ---
set hlsearch                              " Highlight all search matches
set incsearch                             " Show matches as you type
set ignorecase                            " Ignore case in search patterns
set smartcase                             " Override 'ignorecase' if search contains capitals
set backspace=indent,eol,start            " Makes the Backspace key behave logically
