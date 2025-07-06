# whereami

A lightweight Bash script for quickly displaying your current GPS location (latitude, longitude, altitude, and time) from a GPSD-compatible receiver on Linux.

## Features

- Outputs human-readable GPS data directly in the terminal
- Uses `gpspipe` to extract position from GPSD
- Gracefully handles cases where no GPS fix is available

## Prerequisites

- Linux system with:
  - `gpsd` and `gpspipe` installed and running
  - A working GPS receiver (e.g., USB puck)
  - Core utilities: `date`, `grep`, and `sed`

## Installation

1. Copy the script to a directory in your PATH, for example:

sudo cp whereami /usr/local/bin/whereami
sudo chmod +x /usr/local/bin/whereami

2. Ensure your GPS device is connected and gpsd is running:

sudo systemctl start gpsd

3. Run the command:

whereami

Sample Output:

Lat: 38.8977
Lon: -77.0365
Alt (MSL): 20.4 m
Time: 2025-07-06 11:23:45 EDT

or If GPS is unavailable:

Location not available (no GPS fix)

License
MIT License

BY jbirby
