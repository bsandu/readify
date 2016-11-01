#!/bin/bash

function install_gui {
    source ./utils.sh
    source ./nogui.sh
    source ./install_terminator.sh

    sudo add-apt-repository ppa:webupd8team/atom
    sudo apt-get update

    install_nogui
    install_terminator
    install_deb "chromium-browser"

    install_deb "atom"
    apm install minimap
    apm install file-icons
    apm install linter
    apm install linter-jshint
    apm install seti-ui
    apm install neon-syntax
    apm install monokai

    gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ hsize 2
    gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ vsize 2
}

install_gui
