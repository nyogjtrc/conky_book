#!/bin/bash

install_breaking_bad() {
    #remove old conky data
    rm ~/.conky ~/.conkyrc

    #create new link of conky
    ln -s ~/conky_book/package/breaking\ bad\ conky/.conky ~/.conky
    ln -s ~/conky_book/package/breaking\ bad\ conky/conkyrc ~/.conkyrc
}

case $1 in
    1)
        install_breaking_bad
        ;;
    *)
        echo "no conky to install"
        ;;
esac
