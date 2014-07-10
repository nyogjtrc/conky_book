#!/bin/bash
#
# collection book of conky
# for my notebook
# with 1600 * 900 resolution
#
# author: nyo
#
# first version: 2013-07-06
# last version: 2014-07-11
#

########################################

# package path
PACKAGE_PATH="$(pwd)/package"

# color variable
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
NORMAL=$(tput sgr0)

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

    if [ -d "$INSTALL_PATH/fonts" ]; then
        cp $INSTALL_PATH/fonts/* ~/.fonts
        fc-cache -fv
    fi

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
    _install 'breaking_bad'
}

install_conky_lunatico() {
    _uninstall
    _install 'conky_lunatico'
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
