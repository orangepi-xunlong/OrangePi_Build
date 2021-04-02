#!/bin/bash
set -e

#
# This script is used to download different Orange Pi SDK.
# 
TOP_DIR=`pwd`

source "${TOP_DIR}"/lib/general.sh

# Get root first
get_root

# Prepare running-tools
prepare_tools

whiptail --title "Orange Pi Build System" --msgbox \
 "`figlet Orange Pi` It's funny to build your own Linux system,        Let's go to Linux world with Orange Pi." \
          15 50 0

MENUSTR="Plase select build option"
OPTION=$(whiptail --title "Orange Pi Build System" \
    --menu "$MENUSTR" 10 50 3 --cancel-button Finish --ok-button Select \
    "0"   "Build system with uboot/kernel/rootfs/image" \
    3>&1 1>&2 2>&3)

BOARD=$(whiptail --title "Orange Pi Build System" \
	--menu "$MENUSTR" 20 60 10 --cancel-button Finish --ok-button Select \
	"1"  "Orange Pi Win/WinPlus" \
	"2"  "Orange Pi RK3399" \
	"3"  "Orange Pi I96" \
	"4"  "Orange Pi 2G-IOT" \
	"5"  "Orange Pi 3G-IOT" \
	"6" "Orange Pi 4G-iot" \
	3>&1 1>&2 2>&3)

	case "${BOARD}" in
		"1") #A64
			source "${TOP_DIR}"/lib/A64SDK_BuildEnvironment.sh
			;;
		"2") #RK3399
			source "${TOP_DIR}"/lib/RK3399SDK_BuildEnvironment.sh
			;;
		"3" | "4") #RDA
			source "${TOP_DIR}"/lib/RDASDK_BuildEnvironment.sh
			;;
		"5") #3G-IOT
			source "${TOP_DIR}"/lib/3G-iotSDK_BuildEnvironment.sh
			;;
		"6") #4G-IOT
			source "${TOP_DIR}"/lib/4G-iotSDK_BuildEnvironment.sh
			;;
		*) # Other
    			echo "Unsupport Board!!!"
			;;
	esac

# Start downloading the sdk
download_code
