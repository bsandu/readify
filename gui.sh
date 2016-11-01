#!/bin/bash

function install_gui {
    sudo add-apt-repository ppa:webupd8team/atom

    ./nogui.sh
    ./install_terminator.sh

    source ./utils.sh
    install_deb "chromium-browser"
    install_deb "atom"
    sudo chown -R `whoami` ~/.atom
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
