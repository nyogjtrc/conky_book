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

# env path
BIN_PATH="$(pwd)/bin"
LIB_PATH="$(pwd)/lib"
PACKAGE_PATH="$(pwd)/package"

# color variable
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
NORMAL=$(tput sgr0)

usage() {
    cat <<USAGE
./book <command>

command:
    list
    install <package name>
    uninstall
    start
    stop
    restart
    usage
USAGE
}

_check_pkg() {
    if [ -z "$1" ]
    then
        echo "No package argument."
        exit 1;
    fi

    INSTALL_PATH=$PACKAGE_PATH/$1

    # check package
    if [ ! -d $INSTALL_PATH ]; then
        echo "Check package $1 had something wrong."
        exit 1;
    fi

    echo "check package $1 ok."
}

_install() {
    _check_pkg $1

    # always uninstall before installing
    _uninstall

    INSTALL_PATH=$PACKAGE_PATH/$1

    #create new link of conky
    echo "installing conky package."
    ln -s $INSTALL_PATH/conky ~/.conky
    echo "."
    ln -s $INSTALL_PATH/conkyrc ~/.conkyrc
    echo "."

    # install fonts
    if [ -d "$INSTALL_PATH/fonts" ]; then
        cp $INSTALL_PATH/fonts/* ~/.fonts
        fc-cache
    fi

    sleep 1
    echo "install success."
}

_uninstall() {
    #remove old conky data
    rm ~/.conky ~/.conkyrc
}

_start() {
    "$LIB_PATH"/conky.start.sh
}

_stop() {
    killall conky
}

case $1 in
    list)
        ls -1 package
        ;;
    install)
        _install $2
        ;;
    uninstall)
        _uninstall
        ;;
    start)
        _start
        ;;
    stop)
        _stop
        ;;
    restart)
        _stop
        _start
        ;;
    usage | *)
        usage
        ;;
esac
