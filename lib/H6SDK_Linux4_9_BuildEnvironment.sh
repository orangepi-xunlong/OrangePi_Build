#!/bin/bash

# This script is used to build OrangePi H6 environment.
# Write by: Leeboby
# Date:     2018-04-09

set -e
set -x

if [ -z $TOP_ROOT ]; then
    TOP_ROOT=`cd .. && pwd`
fi

# Github
Linux4.9_GITHUB="https://github.com/orangepi-xunlong/OrangePiH6_Linux4.9.git"
uboot_GITHUB="https://github.com/orangepi-xunlong/OrangePiH6_uboot.git"
scripts_GITHUB="https://github.com/orangepi-xunlong/OrangePiH6_scripts.git"
external_GITHUB="https://github.com/orangepi-xunlong/OrangePiH6_external.git"
toolchain="https://codeload.github.com/orangepi-xunlong/OrangePiH6_toolchain/zip/master"

# Prepare dirent
Prepare_dirent=(
Linux4.9
uboot
scripts
external
)

# Change to TOP dirent
cd $TOP_ROOT/..
TOP_ROOT="`pwd`"

if [ ! -d $TOP_ROOT/OrangePiH6_Linux4.9 ]; then
    mkdir $TOP_ROOT/OrangePiH6_Linux4.9
fi
# Download Source Code from Github
function download_Code()
{
    for dirent in ${Prepare_dirent[@]}; do
        echo -e "\e[1;31m Download $dirent from Github \e[0m"
        if [ ! -d $TOP_ROOT/OrangePiH6_Linux4.9/$dirent ]; then
            cd $TOP_ROOT/OrangePiH6_Linux4.9
            GIT="${dirent}_GITHUB"
            echo -e "\e[1;31m Github: ${!GIT} \e[0m"
            git clone ${!GIT}
            mv $TOP_ROOT/OrangePiH6_Linux4.9/OrangePiH6_${dirent} $TOP_ROOT/OrangePiH6_Linux4.9/${dirent}
        else
            cd $TOP_ROOT/OrangePiH6_Linux4.9/${dirent}
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
            if [ ! -d $TOP_ROOT/OrangePiH6_Linux4.9/$dirent ]; then
                cd $TOP_ROOT/OrangePiH6_Linux4.9
                GIT="${dirent}_GITHUB"
                git clone ${!GIT}
                mv $TOP_ROOT/OrangePiH6_Linux4.9/OrangePiH6_${dirent} $TOP_ROOT/OrangePiH6_Linux4.9/${dirent}
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
    if [ ! -f $TOP_ROOT/OrangePiH6_Linux4.9/build.sh ]; then
        ln -s $TOP_ROOT/OrangePiH6_Linux4.9/scripts/build.sh $TOP_ROOT/OrangePiH6_Linux4.9/build.sh    
    fi

    mv $TOP_ROOT/OrangePiH6_Linux4.9/Linux4_9 $TOP_ROOT/OrangePiH6_Linux4.9/kernel
    cd $TOP_ROOT/OrangePiH6_Linux4.9/scripts/
    git checkout Linux4.9
    cd $TOP_ROOT/OrangePiH6_Linux4.9/uboot/
    git checkout Linux4.9
}

function git_configure()
{
    export GIT_CURL_VERBOSE=1
    export GIT_TRACE_PACKET=1
    export GIT_TRACE=1    
}

function install_toolchain()
{
    if [ ! -d $TOP_ROOT/OrangePiH6_Linux4.9/toolchain/gcc-linaro-aarch ]; then
        mkdir -p $TOP_ROOT/OrangePiH6_Linux4.9/.tmp_toolchain
        cd $TOP_ROOT/OrangePiH6_Linux4.9/.tmp_toolchain
	echo -e "\e[1;31m Download toolchain for H6 from Github \e[0m"
        curl -C - -o ./toolchain $toolchain
        unzip $TOP_ROOT/OrangePiH6_Linux4.9/.tmp_toolchain/toolchain
        mkdir -p $TOP_ROOT/OrangePiH6_Linux4.9/toolchain
        mv $TOP_ROOT/OrangePiH6_Linux4.9/.tmp_toolchain/OrangePiH6__toolchain-master $TOP_ROOT/OrangePiH6_Linux4.9/toolchain/toolchain_tar
        rm -rf $TOP_ROOT/OrangePiH6_Linux4.9/.tmp_toolchain
        cd -
    fi
}

install_toolchain
git_configure
download_Code
dirent_check
end_op

whiptail --title "OrangePi Build System" --msgbox \
 "`figlet OrangePi` Succeed to Create OrangePi Build System!        Path:$TOP_ROOT/OrangePiH6" \
            15 50 0
clear
