#!/bin/bash

# This script is used to build OrangePi A64 environment.
# Write by: Buddy
# Date:     2017-01-06

if [ -z $TOP_ROOT ]; then
    TOP_ROOT=`cd .. && pwd`
fi

# Github
kernel_GITHUB="https://github.com/orangepi-xunlong/OrangePiA64_kernel.git"
uboot_GITHUB="https://github.com/orangepi-xunlong/OrangePiA64_uboot.git"
scripts_GITHUB="https://github.com/orangepi-xunlong/OrangePiA64_scripts.git"
external_GITHUB="https://github.com/orangepi-xunlong/OrangePiA64_external.git"
toolchain="https://codeload.github.com/orangepi-xunlong/OrangePiA64_toolchain/zip/master"
# CONFIG_SERIAL_DEBUG is not set


# Prepare dirent
Prepare_dirent=(
kernel
uboot
scripts
external
)

# Change to TOP dirent
cd $TOP_ROOT/..
TOP_ROOT="`pwd`"

if [ ! -d $TOP_ROOT/OrangePiA64 ]; then
    mkdir $TOP_ROOT/OrangePiA64
fi
# Download Source Code from Github
function download_Code()
{
    for dirent in ${Prepare_dirent[@]}; do
        echo -e "\e[1;31m Download $dirent from Github \e[0m"
        if [ ! -d $TOP_ROOT/OrangePiA64/$dirent ]; then
            cd $TOP_ROOT/OrangePiA64
            GIT="${dirent}_GITHUB"
            echo -e "\e[1;31m Github: ${!GIT} \e[0m"
            git clone --depth=1 ${!GIT}
            mv $TOP_ROOT/OrangePiA64/OrangePiA64_${dirent} $TOP_ROOT/OrangePiA64/${dirent}
        else
            cd $TOP_ROOT/OrangePiA64/${dirent}
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
            if [ ! -d $TOP_ROOT/OrangePiA64/$dirent ]; then
                cd $TOP_ROOT/OrangePiA64
                GIT="${dirent}_GITHUB"
                git clone --depth=1 ${!GIT}
                mv $TOP_ROOT/OrangePiA64/OrangePiA64_${dirent} $TOP_ROOT/OrangePiA64/${dirent}
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
    if [ ! -f $TOP_ROOT/OrangePiA64/build.sh ]; then
        ln -s $TOP_ROOT/OrangePiA64/scripts/build.sh $TOP_ROOT/OrangePiA64/build.sh    
    fi
}

function git_configure()
{
    export GIT_CURL_VERBOSE=1
    export GIT_TRACE_PACKET=1
    export GIT_TRACE=1    
}

function install_toolchain()
{
    if [ ! -d $TOP_ROOT/OrangePiA64/toolchain/gcc-linaro-aarch ]; then
        mkdir -p $TOP_ROOT/OrangePiA64/.tmp_toolchain
        cd $TOP_ROOT/OrangePiA64/.tmp_toolchain
        curl -C - -o ./toolchain $toolchain
        unzip $TOP_ROOT/OrangePiA64/.tmp_toolchain/toolchain
        mkdir -p $TOP_ROOT/OrangePiA64/toolchain
        mv $TOP_ROOT/OrangePiA64/.tmp_toolchain/OrangePiA64_toolchain-master $TOP_ROOT/OrangePiA64/toolchain/toolchain_tar
        rm -rf $TOP_ROOT/OrangePiA64/.tmp_toolchain
        cd -
    fi
}

git_configure
download_Code
dirent_check
install_toolchain
end_op

whiptail --title "OrangePi Build System" --msgbox \
 "`figlet OrangePi` Succeed to Create OrangePi Build System!        Path:$TOP_ROOT/OrangePiA64" \
           15 50 0
clear
