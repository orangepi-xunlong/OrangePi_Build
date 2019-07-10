#!/bin/bash
set -e

# This script is used to build OrangePi system
# Write: Buddy
# Date:  2017-01-05

# Support List
# Board Name         ||  Platform
# OrangePi PC2           Allwinner H5
# OrangePi Prime         Allwinner H5
# OrangePi Win           Allwinner A64
# OrangePi Win Plus      Allwinner A64
# OrangePi Zeroplus2     Allwinner H5/H3
# OrangePi Zero          Allwinner H2+
# OrangePi Plus2         Allwinner H3
# OrangePi Plus2E        Allwinner H3
# OrangePi One           Allwinner H3
# OrangePi PC            Allwinner H3
# OrangePi 2             Allwinner H3
# OrangePi Lite          Allwinner H3
# OrangePi PC Plus       Allwinner H3
# OrangePi Mini2         Allwinner H3
# OrangePi One Plus      Allwinner H6
# OrangePi Lite2         Allwinner H6
# OrangePi 3         	 Allwinner H6
# OrangePi RK3399		 RK3399
# OrangePi 4G-IOT		 MT6737
# OrangePi 3G-IOT		 MT6572
# OrangePi 2G-IOT        RDA8810
# OrangePi i96           RDA8810

whiptail --title "OrangePi Build System" --msgbox \
 "`figlet OrangePi` It's funny to build owner Linux system!        Let's go to Linux World with OrangePi" \
          15 50 0

MENUSTR="Plase select build option"

OPTION=$(whiptail --title "OrangePi Build System" \
    --menu "$MENUSTR" 10 50 3 --cancel-button Finish --ok-button Select \
    "0"   "Build system with kernel/uboot/rootfs" \
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

if [ $OPTION = "0" -o $OPTION = "1" ]; then
    # OrangePi H5
    if [ $DISTRO = "0" -o $DISTRO = "5" -o $DISTRO = "14" ]; then
        ./H5SDK_BuildEnvironment.sh
    # OrangePi A64
    elif [ $DISTRO = "12" -o $DISTRO = "13" ]; then
        ./A64SDK_BuildEnvironment.sh
    # OrangePi H6
    elif [ $DISTRO = "17" -o $DISTRO = "18" -o $DISTRO = "19" ]; then
	KERNEL=$(whiptail --title "OrangePi Build System" \
                --menu "$MENUSTR" 10 40 3 --cancel-button Finish --ok-button Select \
                "0"  "linux3.10" \
                "1"  "linux4.9" \
                3>&1 1>&2 2>&3)
        if [ $KERNEL = "0" ]; then
        	./H6SDK_BuildEnvironment.sh
        else
                ./H6SDK_Linux4_9_BuildEnvironment.sh
        fi
    # OrangePi RDA
    elif [ $DISTRO = "15" ]; then
        ./RDASDK_BuildEnvironment.sh
    # OrangePi RDA
    elif [ $DISTRO = "16" ]; then
        ./i96SDK_BuildEnvironment.sh
    # OrangePi H2
    elif [ $DISTRO = "1" ]; then
        ./H2SDK_BuildEnvironment.sh
    # OrangePi RK3399
    elif [ $DISTRO = "20" ]; then
        ./RK3399SDK_BuildEnvironment.sh
    # OrangePi 4G-iot
    elif [ $DISTRO = "21" ]; then
        ./4G-iotSDK_BuildEnvironment.sh
    # OrangePi 3G-iot
    elif [ $DISTRO = "22" ]; then
        ./3G-iotSDK_BuildEnvironment.sh
    # OrangePi H3
    else
	KERNEL=$(whiptail --title "OrangePi Build System" \
    		--menu "$MENUSTR" 10 40 3 --cancel-button Finish --ok-button Select \
    		"0"  "linux3.4" \
    		"1"  "linux4.14" \
    		3>&1 1>&2 2>&3)
	if [ $KERNEL = "0" ]; then
        	./H3SDK_BuildEnvironment.sh
	else
        	./H3SDK_Mainline_BuildEnvironment.sh
	fi
    fi
else
    echo "Bad Operation"
fi
