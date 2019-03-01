#!/bin/bash

# This script is used to build OrangePi RK3399 environment.
# Write by: Buddy
# Date:     2017-01-06

if [ -z $TOP_ROOT ]; then
    TOP_ROOT=`cd .. && pwd`
fi

# Github
kernel_GITHUB="https://github.com/orangepi-xunlong/OrangePiRK3399_kernel.git"
uboot_GITHUB="https://github.com/orangepi-xunlong/OrangePiRK3399_uboot.git"
scripts_GITHUB="https://github.com/orangepi-xunlong/OrangePiRK3399_scripts.git"
external_GITHUB="https://github.com/orangepi-xunlong/OrangePiRK3399_external.git"
toolchain_GITHUB="https://github.com/orangepi-xunlong/OrangePiRK3399_toolchain.git"

# Prepare dirent
Prepare_dirent=(
kernel
uboot
scripts
toolchain
external
)

# Change to TOP dirent
cd $TOP_ROOT/..
TOP_ROOT="`pwd`"

if [ ! -d $TOP_ROOT/OrangePiRK3399 ]; then
    mkdir $TOP_ROOT/OrangePiRK3399
fi
# Download Source Code from Github
function download_Code()
{
    for dirent in ${Prepare_dirent[@]}; do
        echo -e "\e[1;31m Download $dirent from Github \e[0m"
        if [ ! -d $TOP_ROOT/OrangePiRK3399/$dirent ]; then
            cd $TOP_ROOT/OrangePiRK3399
            GIT="${dirent}_GITHUB"
            echo -e "\e[1;31m Github: ${!GIT} \e[0m"
            git clone --depth=1 ${!GIT}
            mv $TOP_ROOT/OrangePiRK3399/OrangePiRK3399_${dirent} $TOP_ROOT/OrangePiRK3399/${dirent}
        else
            cd $TOP_ROOT/OrangePiRK3399/${dirent}
            git pull
        fi
    done
}

function dirent_check() 
{
    for ((i = 0; i < 100; i++)); do

        if [ $i = "99" ]; then
            whiptail --title "Note Box" --msgbox "Please ckeck your network" 10 40 0
            exit 0
        fi
        
        m="none"
        for dirent in ${Prepare_dirent[@]}; do
            if [ ! -d $TOP_ROOT/OrangePiRK3399/$dirent ]; then
                cd $TOP_ROOT/OrangePiRK3399
                GIT="${dirent}_GITHUB"
                git clone --depth=1 ${!GIT}
                mv $TOP_ROOT/OrangePiRK3399/OrangePiRK3399_${dirent} $TOP_ROOT/OrangePiRK3399/${dirent}
                m="retry"
            fi
        done
        if [ $m = "none" ]; then
            i=200
        fi
    done
}

function end_op()
{
    if [ ! -f $TOP_ROOT/OrangePiRK3399/build.sh ]; then
        ln -s $TOP_ROOT/OrangePiRK3399/scripts/build.sh $TOP_ROOT/OrangePiRK3399/build.sh    
    fi
}

function git_configure()
{
    export GIT_CURL_VERBOSE=1
    export GIT_TRACE_PACKET=1
    export GIT_TRACE=1    
}

git_configure
download_Code
dirent_check
end_op

whiptail --title "OrangePi Build System" --msgbox \
 "`figlet OrangePi` Succeed to Create OrangePi Build System!        Path:$TOP_ROOT/OrangePiRK3399" \
             15 50 0
clear
