#!/bin/bash

KERNEL_VER=$(whiptail --title "OrangePi Build System" \
	--menu "$MENUSTR" 10 40 3 --cancel-button Finish --ok-button Select \
	"0"  "linux3.4.113" \
	"1"  "linux5.3.5" \
	3>&1 1>&2 2>&3)

if [ "${KERNEL_VER}" = "0" ]; then
	PLATFORM="OrangePiH3"
	KERNEL="OrangePiH3_kernel"
	UBOOT="OrangePiH3_uboot"
else
	PLATFORM="OrangePiH3_mainline"
	KERNEL="mainline_kernel"
	UBOOT="mainline_uboot"
fi

SCRIPTS="scripts"
EXTERNAL="external"
TOOLCHAIN="toolchain"

ORANGEPI_GIT="https://github.com/orangepi-xunlong"
