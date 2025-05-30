#!/usr/bin/bash
# Reference: https://bbs.archlinux.org/viewtopic.php?id=214298

printf 'script started' | systemd-cat -t low-battery-notification #write to log when script is called
BATTINFO=`acpi -b`
if [[ `echo $BATTINFO | grep Discharging` && `echo $BATTINFO | cut -f 4 -d " " | cut -f 1 -d "%"` < 20 ]] ; then
        printf 'condition is true' | systemd-cat -t low-battery-notification #write to log if condition is true
        /usr/bin/notify-send -u critical "Battery Low" "$BATTINFO"
fi
