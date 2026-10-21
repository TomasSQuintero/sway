#!/bin/sh
# ~/.config/sway/scratchpad-cycle.sh
state="${XDG_RUNTIME_DIR:-/tmp}/scratchpad-cycle"

tree=$(swaymsg -t get_tree)
focused=$(printf '%s' "$tree" | jq -r '[.. | select(.focused? == true) | .id][0] // empty')
hidden=$(printf '%s' "$tree" | jq -r '.. | select(.name? == "__i3_scratch") | .floating_nodes[].id')
next=$(printf '%s\n' "$hidden" | head -n1)

# state file holds: <first window shown> <window currently shown>
[ -f "$state" ] && read -r first current < "$state"

if [ -n "$current" ] && [ "$focused" = "$current" ]; then
    # mid-cycle
    if [ -z "$next" ] || [ "$next" = "$first" ]; then
        # we've been through everything: hide and finish
        swaymsg "[con_id=$current] scratchpad show"
        rm -f "$state"
    else
        # swap directly to the next window, no empty desktop in between
        swaymsg "[con_id=$current] scratchpad show; [con_id=$next] scratchpad show"
        echo "$first $next" > "$state"
    fi
else
    # start a new cycle
    [ -z "$next" ] && exit 0
    swaymsg "[con_id=$next] scratchpad show"
    echo "$next $next" > "$state"
fi
