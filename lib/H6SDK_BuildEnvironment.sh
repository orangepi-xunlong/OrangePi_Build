#!/bin/bash

KERNEL_VER=$(whiptail --title "Orange Pi Build System" \
        --menu "$MENUSTR" 10 40 3 --cancel-button Finish --ok-button Select \
	"1"  "linux4.9" \
        3>&1 1>&2 2>&3)

if [ "${KERNEL_VER}" = "0" ]; then
	PLATFORM="OrangePiH6"
	KERNEL=("OrangePiH6_kernel" "master")
	UBOOT=("OrangePiH6_uboot" "master")
else
	PLATFORM="OrangePiH6_Linux4.9"
	KERNEL=("OrangePiH6_Linux4_9" "master")
	UBOOT=("OrangePiH6_uboot" "Linux4,9")
fi

SCRIPTS=("scripts" "master")
EXTERNAL=("external" "master")
TOOLCHAIN=("toolchain" "aarch64-linux-gnu-4.9")

ORANGEPI_GIT="https://github.com/orangepi-xunlong"
