#!/bin/bash

function install_gui {
    sudo ./nogui.sh
    sudo ./install_terminator.sh
    ./install_atom.sh

    source ./utils.sh
    install_deb "chromium-browser"
}

function set_workspaces {
    gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ hsize 2
    gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ vsize 2
}

install_gui
set_workspaces
