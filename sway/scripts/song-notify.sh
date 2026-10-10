#!/bin/sh
# usage: media.sh next | previous | play-pause

ALLOWED="spotify mpd mpv vlc strawberry rhythmbox cmus"

playerctl "$1"
sleep 0.2
pkill -RTMIN+8 waybar   # refresh the waybar media module

# only notify on track changes
case "$1" in
  next|previous) ;;
  *) exit 0 ;;
esac

info=$(playerctl metadata --format '{{playerName}}|{{artist}}|{{title}}|{{album}}|{{mpris:artUrl}}' 2>/dev/null)
IFS='|' read -r player artist title album art <<EOF
$info
EOF

case " $ALLOWED " in
  *" $player "*) ;;
  *) exit 0 ;;
esac

[ -z "$title" ] && exit 0

case "$art" in
  file://*) icon="${art#file://}" ;;
  *) icon="audio-x-generic" ;;
esac

notify-send -a "Music" -t 2000 -i "$icon" \
  -h string:x-dunst-stack-tag:song \
  "$title" "$artist — $album"
