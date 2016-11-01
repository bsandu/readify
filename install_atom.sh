#!/bin/bash

function install_atom {
    source ./utils.sh

    install_deb "atom"
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
