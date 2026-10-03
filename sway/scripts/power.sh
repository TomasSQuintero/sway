#!/usr/bin/env bash

choice=$(printf '%s\n' \
    "lock" \
    "logout" \
    "suspend" \
    "hibernate" \
    "reboot" \
    "shutdown" \
    | rofi -dmenu -i -p "power")

case "$choice" in
    "lock")      swaylock ;;
    "logout")    swaymsg exit ;;
    "suspend")   systemctl suspend ;;
    "hibernate") systemctl hibernate ;;
    "reboot")    systemctl reboot ;;
    "shutdown")  systemctl poweroff ;;
esac
