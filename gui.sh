#!/bin/bash

function install_gui {
    source ./utils.sh
    source ./nogui.sh
    source ./install_terminator.sh

    install_nogui
    install_terminator
    install_deb "chromium-browser"

    gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ hsize 2
    gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ vsize 2

    wget https://atom.io/download/deb -O atom.deb
    sudo dpkg -i atom.deb
    apm install minimap
    apm install file-icons
    apm install linter
    apm install linter-jshint
    apm install seti-ui
    apm install neon-syntax
    apm install monokai
}

install_gui
