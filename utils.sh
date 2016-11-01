function install_deb {
    exists=`apt-cache policy $1 | grep Installed | grep -v none`
    if [ "$exists" == "" ]
    then
        sudo apt-get -y --allow $1
    else
        echo "Package $1 already exists!"
    fi
}

function install_pathogen {
    mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
}

function install_vim_plugin {
    folder=${1##*/}
    folder=${folder%%.git}

    if [ ! -d ~/.vim/bundle/$folder ]
    then
        oldloc=`pwd`
        cd ~/.vim/bundle
        git clone $1
        echo "Installed package $folder"
        cd $oldloc
    else
        echo "Package $folder already exists"
    fi
}

function install_vim_theme {
    mkdir -p ~/.vim/colors

    colorscheme=${1##*/}
    if [ ! -f ~/.vim/colors/$colorscheme ]
    then
        oldloc=`pwd`
        cd ~/.vim/colors
        wget $1
        echo "Installed colorscheme $colorscheme"
    else
        echo "Colorschepe $colorscheme already exists!"
    fi
}
