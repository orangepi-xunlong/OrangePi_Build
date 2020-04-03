#!/bin/bash

get_root()
{
	for ((i = 0; i < 5; i++)); do
		PASSWD=$(whiptail --title "Orange Pi Build System" \
	               --passwordbox "Enter your root password. Note! Don't use root to run this scripts" 10 60 3>&1 1>&2 2>&3)
	
	        if [ $i = "4" ]; then
		        whiptail --title "Note Box" --msgbox "Error, Invalid password" 10 40 0
		        exit 0
		fi

	        sudo -k
		if sudo -lS &> /dev/null << EOF
$PASSWD
EOF
		then
			i=10
	        else
		        whiptail --title "Orange Pi Build System" --msgbox "Invalid password, Pls input corrent password" \
				            10 40 0 --cancel-button Exit --ok-button Retry
		fi
	done

	echo $PASSWD | sudo ls &> /dev/null 2>&1
}

prepare_tools()
{
	if ! hash apt-get 2>/dev/null; then
		whiptail --title "Orangepi Build System" --msgbox "This scripts requires a Debian based distrbution. If you not use Debian/Ubunut, pls install:[ bsdtar mtools u-boot-tools pv bc sunxi-tools gcc automake make curl qemu dosfstools ]" 10 60
	        exit 1
	fi

	sudo apt-get -y --no-install-recommends --fix-missing install \
	        bsdtar mtools u-boot-tools pv bc \
	        gcc automake make curl lib32z1 lib32z1-dev qemu-user-static \
		dosfstools figlet device-tree-compiler debootstrap 1>/dev/null
}

# Download Source Code from Github
download_code()
{
	if [ ! -d "${TOP_DIR}"/../"${PLATFORM}" ]; then
	    mkdir -p "${TOP_DIR}"/../"${PLATFORM}"
	fi

	PLAT_DIR="$(realpath "${TOP_DIR}"/../"${PLATFORM}")"

	KERNEL_GIT="${ORANGEPI_GIT}/"${KERNEL[0]}".git"
	UBOOT_GIT="${ORANGEPI_GIT}/"${UBOOT[0]}".git"
	SCRIPTS_GIT="${ORANGEPI_GIT}/"${SCRIPTS[0]}".git"
	EXTERNAL_GIT="${ORANGEPI_GIT}/"${EXTERNAL[0]}".git"
	TOOLCHAIN_GIT="${ORANGEPI_GIT}/"${TOOLCHAIN[0]}".git"

	SDK_GIT=(
	${KERNEL_GIT}
	${UBOOT_GIT}
	${SCRIPTS_GIT}
	${EXTERNAL_GIT}
	${TOOLCHAIN_GIT}
	)
	
	SDK_BR=(
	${KERNEL[1]}
	${UBOOT[1]}
	${SCRIPTS[1]}
	${EXTERNAL[1]}
	${TOOLCHAIN[1]}
	)

	SDK_DIR=(
	kernel
	uboot
	scripts
	external
	toolchain
	)

	for ((i = 0; i < 5; i++))
	do
		if [ ! -d "${PLAT_DIR}/${SDK_DIR[i]}" ]; then
            		echo -e "\e[1;31m Download from : "${SDK_GIT[i]}" \e[0m"
			git clone --depth=1 "${SDK_GIT[i]}" "${PLAT_DIR}/${SDK_DIR[i]}" --branch "${SDK_BR[i]}"
        	else
            		echo -e "\e[1;31m Update from : "${SDK_GIT[i]}" \e[0m"
            		cd "${PLAT_DIR}/${SDK_DIR[i]}"
            		git pull
			cd -
        fi
	done

	if [ ! -f "${PLAT_DIR}"/build.sh ]; then
		ln -sv "${PLAT_DIR}"/scripts/build.sh "${PLAT_DIR}"/build.sh    
	fi

	whiptail --title "Orange Pi Build System" --msgbox \
		"`figlet Orange Pi` Succeed to download "${PLATFORM}" build system!        Path: "${PLAT_DIR}"" 15 50 0
	clear	
}
