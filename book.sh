#!/bin/bash

_uninstall() {
    #remove old conky data
    rm ~/.conky ~/.conkyrc
}

_start() {
    ~/conky_book/conky.start.sh
}

_stop() {
    killall conky
}

install_breaking_bad() {
    _uninstall

    #create new link of conky
    ln -s ~/conky_book/package/breaking_bad/conky ~/.conky
    ln -s ~/conky_book/package/breaking_bad/conkyrc ~/.conkyrc

    #install fonts
    cp ~/conky_book/package/breaking_bad/fonts/* ~/.fonts
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

    #install fonts
    cp ~/conky_book/package/Conky-Joey/fonts/* ~/.fonts
    fc-cache -fv
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
    start)
        _start
        ;;
    restart)
        _stop
        _start
        ;;
    stop)
        _stop
        ;;
    *)
        ls -1 package
        ;;
esac
