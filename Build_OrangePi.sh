#!/bin/bash
set -e

#
# This script is used to build different Orange Pi system.
# 
TOP_DIR=`pwd`

source "${TOP_DIR}"/lib/general.sh

# Get root first
get_root

# Prepare running-tools
if [ ! -f "${TOP_DIR}"/lib/.tmp_tools ]; then
    prepare_tools
    echo "Installed Toolchain" > "${TOP_DIR}"/lib/.tmp_tools
fi

whiptail --title "OrangePi Build System" --msgbox \
 "`figlet Orange Pi` It's funny to build your own Linux system,        Let's go to Linux world with Orange Pi." \
          15 50 0

MENUSTR="Plase select build option"
OPTION=$(whiptail --title "OrangePi Build System" \
    --menu "$MENUSTR" 10 50 3 --cancel-button Finish --ok-button Select \
    "0"   "Build system with uboot/kernel/rootfs/image" \
    3>&1 1>&2 2>&3)

DISTRO=$(whiptail --title "OrangePi Build System" \
    --menu "$MENUSTR" 32 60 23 --cancel-button Finish --ok-button Select \
    "0"   "orangepi PC2" \
    "1"   "orangepi Zero" \
    "2"   "orangepi PC Plus" \
    "3"   "orangepi Plus2e" \
    "4"   "orangepi Lite" \
    "5"   "orangepi Plus2(H5)" \
    "6"   "orangepi Plus2(H3)" \
    "7"   "orangepi Plus" \
    "8"   "orangepi PC" \
    "9"   "orangepi One" \
    "10"  "orangepi 2" \
    "11"  "orangepi Mini2" \
    "12"  "orangepi Win" \
    "13"  "orangepi Win plus" \
    "14"  "orangepi Prime" \
    "15"  "orangepi 2G-IOT" \
    "16"  "orangepi i96" \
    "17"  "orangepi One Plus" \
    "18"  "orangepi Lite2" \
    "19"  "orangepi 3" \
    "20"  "orangepi RK3399" \
    "21"  "orangepi 4G-iot" \
    "22"  "orangepi 3G-iot" \
    3>&1 1>&2 2>&3)

if [ $OPTION = "0" ]; then
    # OrangePi H5
    if [ $DISTRO = "0" -o $DISTRO = "5" -o $DISTRO = "14" ]; then
        "${TOP_DIR}"/lib/H5SDK_BuildEnvironment.sh
    # OrangePi A64
    elif [ $DISTRO = "12" -o $DISTRO = "13" ]; then
        "${TOP_DIR}"/lib/A64SDK_BuildEnvironment.sh
    # OrangePi H6
    elif [ $DISTRO = "17" -o $DISTRO = "18" -o $DISTRO = "19" ]; then
	KERNEL=$(whiptail --title "OrangePi Build System" \
                --menu "$MENUSTR" 10 40 3 --cancel-button Finish --ok-button Select \
                "0"  "linux3.10" \
                "1"  "linux4.9" \
                3>&1 1>&2 2>&3)
        if [ $KERNEL = "0" ]; then
        	"${TOP_DIR}"/lib/H6SDK_BuildEnvironment.sh
        else
                "${TOP_DIR}"/lib/H6SDK_Linux4_9_BuildEnvironment.sh
        fi
    # OrangePi RDA
    elif [ $DISTRO = "15" ]; then
        "${TOP_DIR}"/lib/RDASDK_BuildEnvironment.sh
    # OrangePi RDA
    elif [ $DISTRO = "16" ]; then
        "${TOP_DIR}"/lib/i96SDK_BuildEnvironment.sh
    # OrangePi H2
    elif [ $DISTRO = "1" ]; then
        "${TOP_DIR}"/lib/H2SDK_BuildEnvironment.sh
    # OrangePi RK3399
    elif [ $DISTRO = "20" ]; then
        "${TOP_DIR}"/lib/RK3399SDK_BuildEnvironment.sh
    # OrangePi 4G-iot
    elif [ $DISTRO = "21" ]; then
        "${TOP_DIR}"/lib/4G-iotSDK_BuildEnvironment.sh
    # OrangePi 3G-iot
    elif [ $DISTRO = "22" ]; then
        "${TOP_DIR}"/lib/3G-iotSDK_BuildEnvironment.sh
    # OrangePi H3
    else
	source "${TOP_DIR}"/lib/H3SDK_BuildEnvironment.sh
	download_code
    fi
else
    echo "Bad Operation"
fi
