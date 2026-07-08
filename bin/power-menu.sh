#!/usr/bin/env bash

SELECTION=$(echo -e "1. 󰜺  Cancel\n2. 󰤆  Shutdown\n3. 󰑓  Restart" | fuzzel \
    --dmenu \
    --prompt="POWER OFF?" \
    --anchor="center" \
    --width=35 \
    --lines=4 \
    --horizontal-pad=40 \
    --vertical-pad=20 \
    -b "1c1c1cf0" \
    -t "f5f5dcff" \
    --prompt-color="b19cd9ff" \
    --input-color="b19cd9ff" \
    -s "f5f5dcff" \
    -S "1c1c1cff" \
    -m "b19cd9ff" \
    -C "2a2a2aff" \
    --font="Scientifica:size=18")

case "$SELECTION" in
    *Shutdown*)
        systemctl poweroff
        ;;
    *Restart*)
        systemctl reboot
        ;;
    *)
        exit 0
        ;;
esac
