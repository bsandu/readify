#!/bin/bash

function install_nogui {
    sudo apt update
    sudo ./install_vim.sh

    source ./utils.sh

    install_deb "htop"
    install_deb "tmux"
}

install_nogui
