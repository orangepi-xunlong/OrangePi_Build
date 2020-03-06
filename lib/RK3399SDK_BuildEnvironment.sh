#!/bin/bash

if [ "${BOARD}" = "18" ]; then
	PLATFORM="OrangePiRK3399_Pi4"
	KERNEL=("OrangePiRK3399_kernel" "master")
	UBOOT=("OrangePiRK3399_uboot" "master")
	SCRIPTS=("OrangePiRK3399_scripts" "orangepi_4")
	EXTERNAL=("OrangePiRK3399_external" "orangepi_4")
elif [ "${BOARD}" = "19" ]; then
	PLATFORM="OrangePiRK3399"
	KERNEL=("OrangePiRK3399_kernel" "linux4.4.103")
	UBOOT=("OrangePiRK3399_uboot" "orangepi_rk3399")
	SCRIPTS=("OrangePiRK3399_scripts" "master")
	EXTERNAL=("OrangePiRK3399_external" "master")
fi

TOOLCHAIN=("toolchain" "aarch64-linux-gnu-6.3")

ORANGEPI_GIT="https://github.com/orangepi-xunlong"
