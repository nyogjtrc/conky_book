#!/bin/bash

PACKAGE_PATH="$(pwd)/package"

_check_pkg() {
    INSTALL_PATH=$PACKAGE_PATH/$1
    if [ ! -d $INSTALL_PATH ]; then
        echo "check package $1 fail."
        exit 1;
    fi
    echo "check package $1 ok."
}

_install() {
    _check_pkg $1
    INSTALL_PATH=$PACKAGE_PATH/$1

    #create new link of conky
    echo "installing conky package."
    ln -s $INSTALL_PATH/conky ~/.conky
    echo "."
    ln -s $INSTALL_PATH/conkyrc ~/.conkyrc
    echo "."

    sleep 1
    echo "install success."
}

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
    ln -s ~/conky_book/package/conky_joey/conkyrc ~/.conkyrc

    #install fonts
    cp ~/conky_book/package/conky_joey/fonts/* ~/.fonts
    fc-cache -fv
}

install_rejol() {
    _uninstall

    case $1 in
    1)
        sub_package="bar"
        ;;
    2)
        sub_package="original"
        ;;
    3)
        sub_package="vertical"
        ;;
    *)
        sub_package="bar"
        ;;
    esac

    _install "reloj_conky_pack/$sub_package"
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
    4)
        install_rejol $2
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
