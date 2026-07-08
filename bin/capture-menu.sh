#!/usr/bin/env bash

SAVE_DIR="$HOME/Pictures/Screenshots"
VIDEO_DIR="$HOME/Videos/Captures"
mkdir -p "$SAVE_DIR" "$VIDEO_DIR"

TIMESTAMP=$(date +'%Y%m%d_%H%M%S')
SCREENSHOT_PATH="$SAVE_DIR/shot_$TIMESTAMP.png"
VIDEO_PATH="$VIDEO_DIR/rec_$TIMESTAMP.mp4"
GEOM_CACHE="/tmp/last_video_geom"

if pgrep -x "wf-recorder" > /dev/null; then
    pkill -x "wf-recorder"
    notify-send --app-name="screenshot" "Capture Engine" "Video recording terminated and saved."
    exit 0
fi

# Fixed: Returned back to standard --prompt and shifted position anchor to bottom
SELECTION=$(echo -e "1. [] Area Screenshot\n2. [*]  Full Screen\n3. 󰕧  Area Video\n4. 󰁯  Use Last Video Region\n5. 󰹑  Screen on Last Position\n6. x Cancel" | fuzzel \
    --dmenu \
    --prompt="-> Capture Station " \
    --anchor="bottom" \
    --width=45 \
    --lines=7 \
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
    *Area*Screenshot*)
        sleep 0.2
        # -d forces slurp to instantly dismantle its overlay the millisecond you release the mouse button
        GEOM=$(slurp -d -b 00000000 -c b19cd9ff -w 3)
        
        if [ -n "$GEOM" ]; then
            echo "$GEOM" > "$GEOM_CACHE" # Share geometry cache with screen/video
            grim -c -g "$GEOM" "$SCREENSHOT_PATH" && wl-copy < "$SCREENSHOT_PATH"
            notify-send --app-name="screenshot" "Screenshot" "Area captured to clipboard."
        fi
        ;;
    *Full*Screen*)
        sleep 0.2
        ACTIVE_MONITOR=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .name')
        grim -o "$ACTIVE_MONITOR" "$SCREENSHOT_PATH" && wl-copy < "$SCREENSHOT_PATH"
        notify-send --app-name="screenshot" "Screenshot" "Captured active screen ($ACTIVE_MONITOR)."
        ;;
    *Area*Video*)
        sleep 0.2
        GEOM=$(slurp -d -b 00000000 -c b19cd9ff -w 3)
        if [ -n "$GEOM" ]; then
            echo "$GEOM" > "$GEOM_CACHE"
            notify-send --app-name="screenshot" "Capture Engine" "Recording initialized..."
            wf-recorder -g "$GEOM" -f "$VIDEO_PATH" &
        fi
        ;;
    *Last*Video*)
        if [ -f "$GEOM_CACHE" ]; then
            GEOM=$(cat "$GEOM_CACHE")
            notify-send --app-name="screenshot" "Capture Engine" "Recording historical region: $GEOM"
            wf-recorder -g "$GEOM" -f "$VIDEO_PATH" &
        else
            notify-send --app-name="screenshot" "Error" "No cached box dimensions found."
        fi
        ;;
    *Last*Position*)
        if [ -f "$GEOM_CACHE" ]; then
            GEOM=$(cat "$GEOM_CACHE")
            # Instant capture from cache—zero interface animations to hide from
            grim -c -g "$GEOM" "$SCREENSHOT_PATH" && wl-copy < "$SCREENSHOT_PATH"
            notify-send --app-name="screenshot" "Screenshot" "Captured cached region to clipboard."
        else
            notify-send --app-name="screenshot" "Error" "No cached dimensions found."
        fi
        ;;
    *)
        exit 0
        ;;
esac
