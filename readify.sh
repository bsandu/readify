#!/bin/bash

./install_vim.sh

which tmux || sudo apt-get install -y --allow tmux
which curl || sudo apt-get install -y --allow curl
which htop || sudo apt-get install -y --allow htop
which terminator || sudo apt-get install -y --allow terminator

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
