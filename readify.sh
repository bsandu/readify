#!/bin/bash

which terminator || sudo apt-get install -y --force-yes terminator
which curl || sudo apt-get install -y --force-yes curl
which vim || sudo apt-get install -y --force-yes vim
which htop || sudo apt-get install -y --force-yes htop

if [ ! -d ~/.vim ]
then
    mkdir ~/.vim
fi

if [ ! -d ~/.vim/autoload -a ! -d ~/.vim/bundle ]
then
    mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

if [ ! -d ~/.vim/bundle/tabular ]
then
    cd ~/.vim/bundle
    git clone git://github.com/godlygeek/tabular.git
    echo "Installed tabular!"
else
    echo "Tabular already installed..."
fi

if [ ! -d ~/.vim/bundle/vim-surround ]
then
    cd ~/.vim/bundle
    git clone git://github.com/tpope/vim-surround.git
    echo "Installed vim-surround!"
else
    echo "Vim-surround already installed..."
fi

if [ ! -d ~/.vim/bundle/ctrlp.vim ]
then
    cd ~/.vim/bundle
    git clone https://github.com/kien/ctrlp.vim.git
    echo "Installed CtrlP!"
else
    echo "CtrlP already installed..."
fi

if [ ! -d ~/.vim/bundle/rainbow ]
then
    cd ~/.vim/bundle
    git clone https://github.com/luochen1990/rainbow
    echo "Installed Rainbow Parantheses!"
else
    echo "Rainbow Parantheses already installed..."
fi

if [ ! -d ~/.vim/bundle/nerdcommenter.git ]
then
    cd ~/.vim/bundle
    git clone https://github.com/scrooloose/nerdcommenter.git
    echo "Installed NERDCommenter!"
else
    echo " NERDCommenter already installed..."
fi

if [ ! -d ~/.vim/bundle/nerdtree.git ]
then
    cd ~/.vim/bundle
    git clone https://github.com/scrooloose/nerdtree.git
    echo "Installed NERDTree!"
else
    echo " NERDTree already installed..."
fi

if [ ! -d ~/.vim/colors ]
then
    mkdir ~/.vim/colors
    echo "Creating colorscheme folder"
else
    echo "Colorscheme folder already exists"
fi

cd ~/.vim/colors
wget https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim
echo "Installed monokai theme!"
wget https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim
echo "Installed jellybeans theme!"

touch ~/.vimrc

echo "\"Some cool tips'n'tricks:
\":%!xxd and :%!xxd -r transform and revert vim into a hex editor
\":.! inserts the output of an external command into the current document
\"viw - selects the current word
\"diw - viw + delete;
\"ciw - diw + insert;
\"de - delete till the end of the word
\"ZZ - save'n'close
\"zz - scrolls enough to view the current line in the middle
\"D - delete the rest of the line
\"C - cuts the rest of the line and switch to insert
\"dt[char] delete to the next char
\"bye - copies the current word
\"vi[bracket = <[{(][p] selects everything inside the bracked. p also replaces it.
\"ci and di are variations of the command above
\"ctrl+v in insert mode inserts the actual valuea of the key (overrides vimrc)
\"U - uppercase selected
\"u - lowercase selected
\"gv - selects last visual selection
\"Ctrl+v - block selection mode
\"V - line selection mode (selects current line)
\"dd - V + delete
\"cc - dd + insert
\"q: - command history
\"gg - beginning of file
\"G - end of file
\":for i in range(1,255) | .put='10.0.0.'.i | endfor - inserts a range of ips
\"search: /[pattern]
\"replace stuff: vimregex.com
\"another trick: while in block selection, you can select a vertical block, then
\"enter I, type something and then press <esc>. This inserts your text on all the
\"lines contained by the block selection.
\"
\"About folding: 
\"Shift+V -> select lines -> zf makes a fold
\"otherwise, zf[#lines]j
\"za -> toggles the fold
\"zj, zk -> moves to next/previous fold;
\"zd -> deletes the fold
\"zE -> deletes all folds
\"zR, zM -> open/closes all folds;
\"
\"About CtrlP:
\"Ctrl + P -> opens CtrlP (what a surprise)
\"<c-t> - open in new tab
\"<c-v>, <c-x> - open in split
\"<c-b> - switch modes
\"<c-d> - search only filename
\"<c-r> - regex
\":cd [path] in normal mode to change ctrlp path

nmap j gj
nmap k gk

nmap <Down> g<Down>
nmap <Up> g<Up>

let g:rainbow_active = 1

set tabstop=8
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

set autoindent
set smartindent

syntax on
colorscheme monokai

set colorcolumn=80
set number
set hlsearch
set ignorecase
set smartcase
set incsearch
set foldenable
set mouse=a

set foldnestmax=1
setlocal fdm=syntax

set runtimepath^=~/.vim/bundle/ctrlp.vim

filetype plugin on
\" start nedtree if vim is opened with no files:
\"autocmd StdinReadPre * let s:std_in=1
\"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
\" close vim if nerdtree is the only open window:
\"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

\" highlight trailing whitespace:
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
\" old NERDTree settings
autocmd vimenter * NERDTree
autocmd VimEnter * wincmd p
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr(\"$\") == 1 && exists(\"b:NERDTreeType\") && b:NERDTreeType == \"primary\") | q | endif

let g:ctrlp_working_path_mode = 0

execute pathogen#infect()" > ~/.vimrc
echo "Installed new vimrc!"

if [ ! -d ~/.config/terminator ]
then
    mkdir ~/.config/terminator
    echo "Created terminator folder in .config"
fi

echo "[global_config]
  geometry_hinting = False
  enabled_plugins = ,
  borderless = True
  handle_size = 1
  tab_position = hidden
[keybindings]
  broadcast_all = <Shift><Super>a
  broadcast_off = <Shift><Super>x
[profiles]
  [[default]]
    background_image = None
    scrollback_infinite = True
    show_titlebar = False
[layouts]
  [[default]]
    [[[child1]]]
      type = Terminal
      parent = window0
    [[[window0]]]
      type = Window
      parent = ""
[plugins]" > ~/.config/terminator/config
echo "Installed new terminator config!"
