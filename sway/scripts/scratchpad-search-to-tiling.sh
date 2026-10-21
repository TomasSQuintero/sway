#!/bin/sh
# ~/.config/sway/scratchpad-tile.sh

nodes=$(swaymsg -t get_tree | jq -c '[.. | select(.name? == "__i3_scratch") | .floating_nodes[]]')

if [ "$(printf '%s' "$nodes" | jq 'length')" -eq 0 ]; then
    command -v notify-send >/dev/null && notify-send "Scratchpad" "No hidden windows"
    exit 0
fi

idx=$(printf '%s' "$nodes" \
    | jq -r '.[] | "\(.app_id // .window_properties.class // "?"): \(.name)"' \
    | rofi -dmenu -i -format i -p "scratchpad")

[ -z "$idx" ] && exit 0

id=$(printf '%s' "$nodes" | jq -r ".[$idx].id")
swaymsg "[con_id=$id] scratchpad show, floating disable, focus"
