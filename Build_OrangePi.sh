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
	--menu "$MENUSTR" 32 60 23 --cancel-button Finish --ok-button Select \
	"0"   "Orange Pi R1" \
	"1"   "Orange Pi Zero" \
	"2"   "Orange Pi One" \
	"3"   "Orange Pi Lite" \
	"4"   "Orange Pi PC" \
	"5"   "Orange Pi PC Plus" \
	"6"   "Orange Pi Plus" \
	"7"   "Orange Pi Plus2E" \
	"8"   "Orange Pi Zero Plus2(H3)" \
	"9"   "Orange Pi PC2" \
	"10"  "Orange Pi Prime" \
	"11"  "Orange Pi Zero Plus" \
	"12"  "Orange Pi Zero Plus2(H5)" \
	"13"  "Orange Pi Win" \
	"14"  "Orange Pi Win plus" \
	"15"  "Orange Pi 3" \
	"16"  "Orange Pi Lite2" \
	"17"  "Orange Pi One Plus" \
	"18"  "Orange Pi 4" \
	"19"  "Orange Pi RK3399" \
	"20"  "Orange Pi I96" \
	"21"  "Orange Pi 2G-IOT" \
	"22"  "Orange Pi 3G-iot" \
	"23"  "Orange Pi 4G-iot" \
	3>&1 1>&2 2>&3)

	case "${BOARD}" in
		"0" | "1") #H2
			source "${TOP_DIR}"/lib/H2SDK_BuildEnvironment.sh
			;;
		"2" | "3" | "4" | "5" | "6" | "7" | "8") #H3
			source "${TOP_DIR}"/lib/H3SDK_BuildEnvironment.sh
			;;
		"9" | "10" | "11" | "12") #H5
			source "${TOP_DIR}"/lib/H5SDK_BuildEnvironment.sh
			;;
		"13" | "14") #A64
			source "${TOP_DIR}"/lib/A64SDK_BuildEnvironment.sh
			;;
		"15" | "16" | "17") #H6
			source "${TOP_DIR}"/lib/H6SDK_BuildEnvironment.sh
			;;
		"18" | "19") #RK3399
			source "${TOP_DIR}"/lib/RK3399SDK_BuildEnvironment.sh
			;;
		"20" | "21") #RDA 
			source "${TOP_DIR}"/lib/RDASDK_BuildEnvironment.sh
			;;
		"22") #3G-IOT
			source "${TOP_DIR}"/lib/3G-iotSDK_BuildEnvironment.sh
			;;
		"23") #4G-IOT
			source "${TOP_DIR}"/lib/4G-iotSDK_BuildEnvironment.sh
			;;
		*) # Other
    			echo "Unsupport Board!!!"
			;;
	esac

# Start downloading the sdk
download_code
