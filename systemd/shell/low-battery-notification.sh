#!/usr/bin/bash
# https://bbs.archlinux.org/viewtopic.php?id=214298

printf 'script started' | systemd-cat -t low-battery-notification #write to log when script is called
BATTINFO=`acpi -b`
if [[ `echo $BATTINFO | grep Discharging` && `echo $BATTINFO | cut -f 5 -d " "` < 00:20:00 ]] ; then
        printf 'condition is true' | systemd-cat -t low-battery-notification #write to log if condition is true
        /usr/bin/notify-send -u low "Battery Low" "$BATTINFO"
fi
