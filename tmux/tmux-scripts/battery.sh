#!/bin/bash
icon_battery='  '
icon_charging='  '

percentage=$(upower -i $(upower -e | grep BAT) | grep --color=never -E "percentage" | awk '{print $2}')
state=$(upower -i $(upower -e | grep BAT) | grep --color=never -E "state" | awk '{print $2}')

battery_life=''
if [ "$state" = "charging" ]; then
  battery_life="${icon_charging} ${percentage}"
else
  battery_life="${icon_battery} ${percentage}"
fi

echo "$battery_life"
