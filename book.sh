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
}

install_conky_lunatico() {
    _uninstall

    #create new link of conky
    ln -s ~/conky_book/package/conky_lunatico/conky ~/.conky
    ln -s ~/conky_book/package/conky_lunatico/conkyrc ~/.conkyrc
}

case $1 in
    1)
        install_breaking_bad
        ;;
    2)
        install_conky_lunatico
        ;;
    uninstall)
        _uninstall
        ;;
    *)
        ls -1 package
        ;;
esac
