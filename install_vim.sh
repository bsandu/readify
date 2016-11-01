#!/bin/bash

function install_vim {
    source ./utils.sh

    install_deb "vim"

    install_pathogen

    install_vim_plugin "https://github.com/godlygeek/tabular.git"
    install_vim_plugin "https://github.com/kien/ctrlp.vim.git"
    install_vim_plugin "https://github.com/luochen1990/rainbow"
    install_vim_plugin "https://github.com/scrooloose/nerdcommenter.git"
    install_vim_plugin "https://github.com/scrooloose/nerdtree.git"
    install_vim_plugin "https://github.com/sheerun/vim-polyglot.git"

    install_vim_theme "https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim"
    install_vim_theme "https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim"
    install_vim_theme "https://raw.githubusercontent.com/joshdick/onedark.vim/master/colors/onedark.vim"

    cat > ~/.vimrc <<EOF
"Some cool tips'n'tricks:
":%!xxd and :%!xxd -r transform and revert vim into a hex editor
":.! inserts the output of an external command into the current document
"viw - selects the current word
"diw - viw + delete;
"ciw - diw + insert;
"de - delete till the end of the word
"ZZ - save'n'close
"zz - scrolls enough to view the current line in the middle
"D - delete the rest of the line
"C - cuts the rest of the line and switch to insert
"dt[char] delete to the next char
"bye - copies the current word
"vi[bracket = <[{(][p] selects everything inside the bracked. p also replaces it.
"ci and di are variations of the command above
"ctrl+v in insert mode inserts the actual valuea of the key (overrides vimrc)
"U - uppercase selected
"u - lowercase selected
"gv - selects last visual selection
"Ctrl+v - block selection mode
"V - line selection mode (selects current line)
"dd - V + delete
"cc - dd + insert
"q: - command history
"gg - beginning of file
"G - end of file
":for i in range(1,255) | .put='10.0.0.'.i | endfor - inserts a range of ips
"search: /[pattern]
"replace stuff: vimregex.com
"another trick: while in block selection, you can select a vertical block, then
"enter I, type something and then press <esc>. This inserts your text on all the
"lines contained by the block selection.
"
"About folding:
"Shift+V -> select lines -> zf makes a fold
"otherwise, zf[#lines]j
"za -> toggles the fold
"zj, zk -> moves to next/previous fold;
"zd -> deletes the fold
"zE -> deletes all folds
"zR, zM -> open/closes all folds;
"
"About CtrlP:
"Ctrl + P -> opens CtrlP (what a surprise)
"<c-t> - open in new tab
"<c-v>, <c-x> - open in split
"<c-b> - switch modes
"<c-d> - search only filename
"<c-r> - regex
":cd [path] in normal mode to change ctrlp path

nmap j gj
nmap k gk

nmap <Down> g<Down>
nmap <Up> g<Up>

set tabstop=8
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

set autoindent
set smartindent

syntax on
colorscheme onedark

set colorcolumn=80
set number
set hlsearch
set ignorecase
set smartcase
set incsearch
set foldenable
set mouse=a

set fdm=manual

set runtimepath^=~/.vim/bundle/ctrlp.vim

filetype plugin on

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

autocmd vimenter * NERDTree
autocmd VimEnter * wincmd p
map <C-n> :NERDTreeToggle<CR>
function! s:CloseIfOnlyNerdTreeLeft()
if exists("t:NERDTreeBufName")
if bufwinnr(t:NERDTreeBufName) != -1
if winnr("$") == 1
q
endif
endif
endif
endfunction
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

let g:ctrlp_working_path_mode = 0

execute pathogen#infect()
EOF
}

install_vim
