#!/bin/sh

which terminator || sudo apt-get install -y --allow terminator

if [ ! -d ~/.config/terminator ]
then
    mkdir ~/.config/terminator
    echo "Created terminator folder in .config"
fi

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

echo "Installed new terminator config!"

wget https://atom.io/download/deb -O atom.deb
sudo dpkg -i atom.deb
apm install minimap
apm install file-icons
apm install linter
apm install linter-jshint
apm install seti-ui
apm install neon-syntax
apm install monokai
