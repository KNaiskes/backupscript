#!/bin/bash

# known networks must be stored in /etc/wpa_supplicant/wpa_supplicant.conf
# in such form 
# network={
# ssid="ssid"
# psk="secret"
# }

connect="sudo wpa_supplicant -B -iwlan0 -c /etc/wpa_supplicant/wpa_supplicant.conf -Dwext && sudo dhclient wlan0"

$connect
