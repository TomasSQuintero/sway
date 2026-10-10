#!/bin/sh
last=""
lpos=0
llen=0

# Only notify for these players
ALLOWED="spotify mpd mpv vlc strawberry rhythmbox cmus"

while true; do
  info=$(playerctl metadata --format '{{playerName}}|{{artist}}|{{title}}|{{album}}|{{mpris:artUrl}}|{{position}}|{{mpris:length}}' 2>/dev/null)
  IFS='|' read -r player artist title album art pos len <<EOF
$info
EOF

  # skip anything that isn't an allowed music player
  case " $ALLOWED " in
    *" $player "*) ;;
    *) sleep 0.5; continue ;;
  esac

  id="$artist|$title"
  if [ -n "$title" ] && [ "$id" != "$last" ]; then
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
