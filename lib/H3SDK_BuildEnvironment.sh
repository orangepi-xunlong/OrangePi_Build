#!/bin/bash


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
