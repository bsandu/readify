#!/bin/bash

function install_nogui {
    source ./utils.sh
    source ./install_vim.sh
    source ./install_tmux.sh

    install_deb "curl"
    install_deb "htop"
    install_deb "openssh-server"
    install_deb "git"
    install_vim
    install_tmux
}

install_nogui
