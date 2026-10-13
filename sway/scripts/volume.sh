#!/usr/bin/env bash
step=5
width=27

case $1 in
  up)   wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ ${step}%+ ;;
  down) wpctl set-volume @DEFAULT_AUDIO_SINK@ ${step}%- ;;
  mute) wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle ;;
esac

read -r _ vol muted < <(wpctl get-volume @DEFAULT_AUDIO_SINK@)
pct=$(awk -v v="$vol" 'BEGIN{printf "%d", v*100+0.5}')
(( pct > 100 )) && pct=100
pos=$(( pct * (width - 1) / 100 ))

dot="●"
[[ -n $muted ]] && dot="○"

bar="├"
for (( i = 0; i < width; i++ )); do
  if (( i == pos )); then bar+="$dot"; else bar+="─"; fi
done
bar+="┤"

dunstify -a volume -u low -t 1200 \
  -h string:x-dunst-stack-tag:volume \
  "volume" "$bar"
