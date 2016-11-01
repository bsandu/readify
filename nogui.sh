#!/bin/bash

function install_nogui {
    sudo apt-get update

    sudo ./install_vim.sh
    sudo ./install_tmux.sh

    source ./utils.sh

    install_deb "curl"
    install_deb "htop"
    install_deb "openssh-server"
    install_deb "git"
}

install_nogui
