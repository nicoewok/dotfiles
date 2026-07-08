#!/usr/bin/env bash

# Count the current items resting in Mako's history buffer
HISTORY_COUNT=$(makoctl history -j | jq '.data[0] | length')

if [ "$HISTORY_COUNT" -eq 0 ] || [ -z "$HISTORY_COUNT" ]; then
    # Clean queue state: matches Soft Warm Beige text primary
    echo "󰂜 [0]"
else
    # Correct Pango implementation for Waybar to apply Pastel Purple
    echo "<span foreground='#b19cd9'>󰂚 [$HISTORY_COUNT]</span>"
fi
