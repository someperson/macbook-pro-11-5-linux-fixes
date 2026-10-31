#!/bin/bash
[ "$1" = "post" ] && exec /usr/sbin/modprobe facetimehd
[ "$1" = "pre" ] && exec /usr/sbin/rmmod facetimehd
exit 0
