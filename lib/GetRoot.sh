#!/bin/bash
set -e

# This script is used to root

for ((i = 0; i < 5; i++)); do
    PASSWD=$(whiptail --title "OrangePi Build System" \
        --passwordbox "Enter your root password. Note! Don't use root to run this scripts" \
        10 60 3>&1 1>&2 2>&3)

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
        whiptail --title "OrangePi Build System" --msgbox "Invalid password, Pls input corrent password" \
            10 40 0 --cancel-button Exit --ok-button Retry
    fi
done

echo $PASSWD | sudo ls &> /dev/null 2>&1
