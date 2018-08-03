#!/bin/sh

set -e

dependencies="\
    whiptail \
    curl git rsync unzip \
    cpio figlet device-tree-compiler parted \
    bsdtar mtools u-boot-tools pv bc \
    gcc automake make \
    lib32z1 lib32z1-dev qemu-user-static \
    dosfstools figlet device-tree-compiler debootstrap \
"

if ! hash apt-get 2>/dev/null; then
    err_msg="This scripts requires a Debian based distrbution. If you not use Debian/Ubuntu, pls install:[ $dependencies ]"
    if ! hash whiptail 2>/dev/null; then
        echo "ERROR: $err_msg" >&2
    else
        whiptail --title "Orangepi Build System" --msgbox "$err_msg" 15 60 0
    fi
    exit 1
fi

apt-get -y --no-install-recommends --fix-missing install $dependencies
