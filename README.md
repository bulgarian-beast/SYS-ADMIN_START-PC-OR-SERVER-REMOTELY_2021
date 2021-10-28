# TURN ON A COMPUTER REMOTELY THANKS TO WAKE ON LAN

## BIOS SETUP

First you need to enable and disable some parameters in the bios (each bios call parameters differently)

### DISABLE DEEP-SLEEP

If your bios have a deep-sleep parameter disable it.

### ENABLE WoL

In a power managment section look for Wake on Lan and enable it.

Then reboot.

## FIND THE FINGERPRINT OF THE NETWORK CARD

It is the six char write after "2: " when you run "ip a"

run the following command:

    ip a | grep "2: "

## INSTALL ETHTOOL

* *ubuntu*

    sudo apt-get install ethtool

## SET UP ETHTOOL

    sudo ethtool -s enp4s0 wol g

## NOW MAKE IT WORK EVERYTIMES

### MODIFY OR CREATE A FILE AT /etc/systemd/system/wol.service
    sudo touch /etc/systemd/system/wol.service

### WRITE THE FOLLOWING

    [Unit]
    Description=Configure Wake On Lan

    [Service]
    Type=oneshot
    ExecStart=/sbin/ethtool -s enp4s0 wol g

    [Install]
    WantedBy=basic.target

## RELOAD THE DAEMON

    sudo systemctl daemon-reload

## ACTIVATE IT

    sudo systemctl enable wol.service

## REBOOT YOUR MACHINE

    reboot

## IN ORDER TO SEND A WAKE ON LAN MESSAGE YOU HAVE TO

### KNOW YOUR TARGET IP

    ifconfig | grep "inet "

### KNOW YOUR MAC ADDRESS

    ifconfig | grep "ether " &&

# START_PC_OR_SERVER_REMOTELY
# START_PC_OR_SERVER_REMOTELY
