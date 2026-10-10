#!/bin/sh
last=""
lpos=0
llen=0

while true; do
  info=$(playerctl metadata --format '{{artist}}|{{title}}|{{album}}|{{mpris:artUrl}}|{{position}}|{{mpris:length}}' 2>/dev/null)
  IFS='|' read -r artist title album art pos len <<EOF
$info
EOF

  id="$artist|$title"
  if [ -n "$title" ] && [ "$id" != "$last" ]; then
    # notify only if the previous track still had >3s left (manual change)
    if [ -n "$last" ] && [ $((llen - lpos)) -gt 3000000 ]; then
      case "$art" in
        file://*) icon="${art#file://}" ;;
        *) icon="audio-x-generic" ;;
      esac
      notify-send -a "Music" -t 2000 -i "$icon" \
        -h string:x-dunst-stack-tag:song \
        "$title" "$artist — $album"
    fi
    last="$id"
  fi

  lpos=${pos:-0}
  llen=${len:-0}
  sleep 0.5
done
