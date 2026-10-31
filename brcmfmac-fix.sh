#!/bin/bash
if [ "$1" = "pre" ]
then
    /usr/sbin/systemctl stop wpa_supplicant
    /usr/sbin/rmmod brcmfmac_wcc
    /usr/sbin/rmmod brcmfmac
elif [ "$1" = "post" ]
then
    /usr/sbin/modprobe brcmfmac
    /usr/sbin/systemctl start wpa_supplicant
fi

exit 0
