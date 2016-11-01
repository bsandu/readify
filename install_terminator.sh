#!/bin/bash

function install_terminator {
    source ./utils.sh

    install_deb "terminator"

    mkdir -p ~/.config/terminator
    cat > ~/.config/terminator/confg <<EOF
[global_config]
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
[plugins]
EOF
}

install_terminator
