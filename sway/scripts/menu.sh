#!/usr/bin/env bash

# Gap sizes to restore when gaps are turned back on
INNER=10
OUTER=5
STATE="${XDG_RUNTIME_DIR:-/tmp}/sway-gaps-off"

power_menu() {
    local choice
    choice=$(printf '%s\n' \
        "lock" \
        "logout" \
        "suspend" \
        "hibernate" \
        "reboot" \
        "shutdown" \
        "back" \
        | rofi -dmenu -i -p "power")

    case "$choice" in
        "lock")      exec swaylock ;;
        "logout")    swaymsg exit ;;
        "suspend")   systemctl suspend ;;
        "hibernate") systemctl hibernate ;;
        "reboot")    systemctl reboot ;;
        "shutdown")  systemctl poweroff ;;
        "back")      main_menu ;;
    esac
}

main_menu() {
    local choice
    choice=$(printf '%s\n' \
        "bluetooth" \
        "toggle waybar" \
        "toggle gaps" \
        "power" \
        | rofi -dmenu -i -p "menu")

    case "$choice" in
        "bluetooth")
            exec kitty --class bluetui bluetui
            ;;
        "toggle waybar")
            pkill -SIGUSR1 waybar
            ;;
        "toggle gaps")
            if [ -e "$STATE" ]; then
                swaymsg "gaps inner all set $INNER; gaps outer all set $OUTER"
                rm "$STATE"
            else
                swaymsg "gaps inner all set 0; gaps outer all set 0"
                touch "$STATE"
            fi
            ;;
        "power")
            power_menu
            ;;
    esac
}
main_menu
