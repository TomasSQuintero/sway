#!/usr/bin/env bash
# ~/.config/sway/scripts/scratchpad-rofi.sh

# Scratchpad windows live as floating nodes in the hidden __i3_scratch workspace
mapfile -t windows < <(
  swaymsg -t get_tree | jq -r '
    .. | objects
    | select(.type? == "workspace" and .name == "__i3_scratch")
    | .floating_nodes[]
    | "\(.id)\t\(.app_id // .window_properties.class // "unknown"): \(.name | gsub("\n"; " "))"
  '
)

if [ ${#windows[@]} -eq 0 ]; then
  notify-send "Scratchpad" "No windows in the scratchpad" 2>/dev/null
  exit 0
fi

# Show only the label in rofi, get back the selected index
idx=$(printf '%s\n' "${windows[@]}" | cut -f2- \
  | rofi -dmenu -i -p "scratchpad" -format i)

[ -z "$idx" ] && exit 0

con_id=$(cut -f1 <<<"${windows[$idx]}")

# Same as cycling, but targeted at the chosen window
swaymsg "[con_id=$con_id] scratchpad show"
