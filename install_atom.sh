#!/bin/bash

function install_atom {
    #atom_deb="atom-amd64.deb"
    #latest=`curl https://github.com/atom/atom/releases/latest -s | cut -d "\"" -f 2`
    #latest=${latest/tag/download}
    #wget ${latest}/${atom_deb}
    #sudo dpkg -i ${atom_deb}
    #rm ${atom_deb}

    mkdir -p ~/.atom
    #sudo chown -R `whoami` ~/.atom
    apm install minimap
    apm install file-icons
    apm install linter
    apm install linter-jshint
    apm install neon-syntax
    apm install tabularize
    apm install monokai
    cat > ~/.atom/config.cson <<EOF
"*":
  core:
    telemetryConsent: "no"
    themes: [
      "one-dark-ui"
      "monokai"
    ]
  editor:
    showIndentGuide: true
    showInvisibles: true
    softWrap: true
    tabLength: 4
  welcome:
    showOnStartup: false
EOF
}

install_atom
