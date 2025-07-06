#!/bin/bash
# whereami - quick lat/lon/alt/time from gpspipe

RAW=$(gpspipe -w -n 30 | grep -m 1 '"lat"' )

if [ -z "$RAW" ]; then
    echo "Location not available (no GPS fix)"
    exit 1
fi

LAT=$(echo "$RAW" | sed -n 's/.*"lat":\([^,}]*\).*/\1/p')
LON=$(echo "$RAW" | sed -n 's/.*"lon":\([^,}]*\).*/\1/p')
ALT=$(echo "$RAW" | sed -n 's/.*"altMSL":\([^,}]*\).*/\1/p')
TIME=$(echo "$RAW" | sed -n 's/.*"time":"\([^"]*\)".*/\1/p')

# Convert ISO time to readable format
HUMAN_TIME=$(date -d "$TIME" +"%Y-%m-%d %H:%M:%S %Z")

echo "Lat: $LAT"
echo "Lon: $LON"
echo "Alt (MSL): $ALT m"
echo "Time: $HUMAN_TIME"
