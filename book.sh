#!/bin/bash

_uninstall() {
    #remove old conky data
    rm ~/.conky ~/.conkyrc
}

install_breaking_bad() {
    _uninstall

    #create new link of conky
    ln -s ~/conky_book/package/breaking\ bad\ conky/.conky ~/.conky
    ln -s ~/conky_book/package/breaking\ bad\ conky/conkyrc ~/.conkyrc
    cp ~/conky_book/package/breaking\ bad\ conky/fonts/* ~/.fonts
    fc-cache -fv
}

install_conky_lunatico() {
    _uninstall

    #create new link of conky
    ln -s ~/conky_book/package/conky_lunatico/conky ~/.conky
    ln -s ~/conky_book/package/conky_lunatico/conkyrc ~/.conkyrc
}

install_conky_joey() {
    _uninstall

    #create new link of conky
    ln -s ~/conky_book/package/Conky-Joey/conkyrc ~/.conkyrc
    cp ~/conky_book/package/Conky-Joey/fonts/* ~/.fonts
    fc-cache -fv
}

rerun() {
    killall conky
    ~/conky_book/conky.start.sh
}

case $1 in
    1)
        install_breaking_bad
        ;;
    2)
        install_conky_lunatico
        ;;
    3)
        install_conky_joey
        ;;
    uninstall)
        _uninstall
        ;;
    restart)
        rerun
        ;;
    *)
        ls -1 package
        ;;
esac