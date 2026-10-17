#!/usr/bin/env bash

choice=$(printf '%s\n' \
    "logout" \
    "sleep" \
    "reboot" \
    "shutdown" \
    | rofi -dmenu -i -p "power")

case "$choice" in
    "logout")    swaymsg exit ;;
    "sleep")   systemctl suspend ;;
    "reboot")    systemctl reboot ;;
    "shutdown")  systemctl poweroff ;;
esac

    # "lock" \
    # "hibernate" \
    # "lock")      swaylock ;;
    # "hibernate") systemctl hibernate ;;
