#!/bin/bash

KERNEL_VER=$(whiptail --title "Orange Pi Build System" \
        --menu "$MENUSTR" 10 40 3 --cancel-button Finish --ok-button Select \
	"1"  "linux4.9" \
	"2"  "mainline" \
        3>&1 1>&2 2>&3)

SCRIPTS=("scripts" "orangepi-h6_v2.0.2")
EXTERNAL=("external" "orangepi-h6_v2.0.2")
TOOLCHAIN=("toolchain" "aarch64-linux-gnu-4.9")

if [ "${KERNEL_VER}" = "0" ]; then
	PLATFORM="OrangePiH6"
	KERNEL=("OrangePiH6_kernel" "master")
	UBOOT=("OrangePiH6_uboot" "master")
elif [ "${KERNEL_VER}" = "1"  ];then
	PLATFORM="OrangePiH6_Linux4.9"
	KERNEL=("OrangePiH6_Linux4_9" "master")
	UBOOT=("OrangePiH6_uboot" "Linux4.9")
elif [ "${KERNEL_VER}" = "2"  ];then
	PLATFORM="OrangePiH6_mainline"
	KERNEL=("mainline_kernel" "orangepi-h6")
	UBOOT=("mainline_uboot" "orangepi-h6")
	TOOLCHAIN=("toolchain" "aarch64-linux-gnu-7.4.1")
fi

ORANGEPI_GIT="https://github.com/orangepi-xunlong"
