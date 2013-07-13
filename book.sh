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

case $1 in
    1)
        install_breaking_bad
        ;;
    uninstall)
        _uninstall
        ;;
    *)
        ls -1 package
        ;;
esac
