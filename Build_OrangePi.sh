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
	"1"  "Orange Pi PC2" \
	"2"  "Orange Pi Prime" \
	"3"  "Orange Pi Zero Plus" \
	"4"  "Orange Pi Zero Plus2(H5)" \
	"5"  "Orange Pi Win/WinPlus" \
	"6"  "Orange Pi RK3399" \
	"7"  "Orange Pi I96" \
	"8"  "Orange Pi 2G-IOT" \
	"9"  "Orange Pi 3G-IOT" \
	"10" "Orange Pi 4G-iot" \
	3>&1 1>&2 2>&3)

	case "${BOARD}" in
		"1" | "2" | "3" | "4") #H5
			source "${TOP_DIR}"/lib/H5SDK_BuildEnvironment.sh
			;;
		"5") #A64
			source "${TOP_DIR}"/lib/A64SDK_BuildEnvironment.sh
			;;
		"6") #RK3399
			source "${TOP_DIR}"/lib/RK3399SDK_BuildEnvironment.sh
			;;
		"7" | "8") #RDA
			source "${TOP_DIR}"/lib/RDASDK_BuildEnvironment.sh
			;;
		"9") #3G-IOT
			source "${TOP_DIR}"/lib/3G-iotSDK_BuildEnvironment.sh
			;;
		"10") #4G-IOT
			source "${TOP_DIR}"/lib/4G-iotSDK_BuildEnvironment.sh
			;;
		*) # Other
    			echo "Unsupport Board!!!"
			;;
	esac

# Start downloading the sdk
download_code
