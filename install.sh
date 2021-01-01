#!/bin/bash

# verify that the script is run as root
cp prismatik /usr/local/bin
# change xavier as the current user
cp led.service /etc/systemd/system
# modify the vendor and product id: run lsblk while controller is plugged in
cp 93-ambilight.rules /etc/udev/rules.d
systemctl enable autoadb.service
