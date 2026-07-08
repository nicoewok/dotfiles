#!/usr/bin/env bash
if [ -f /sys/class/drm/card0/device/gpu_busy_percent ]; then
    UTIL=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits | awk '{print $1}')
else
    UTIL=0
fi
echo "{\"percentage\": $UTIL}"
