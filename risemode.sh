#!/bin/bash

VENDOR_ID="aa88"
PRODUCT_ID="8666"
HIDRAW=""

for f in /sys/class/hidraw/hidraw*; do
    FILE=$(basename "$f")

    HID_ID=$(grep HID_ID "$f/device/uevent" 2>/dev/null | cut -d= -f2)

    [[ -z "$HID_ID" ]] && continue

    VID=$(echo "$HID_ID" | cut -d: -f2 | sed 's/^0*//' | tr 'A-Z' 'a-z')
    PID=$(echo "$HID_ID" | cut -d: -f3 | cut -d. -f1 | sed 's/^0*//' | tr 'A-Z' 'a-z')

    if [[ "$VID" == "$VENDOR_ID" && "$PID" == "$PRODUCT_ID" ]]; then
        HIDRAW="$FILE"
        break
    fi
done

function get_temp {
	TEMP="$(sensors 2>/dev/null | grep -oP 'Tctl.*?\+\K[0-9]+')"
	TEMP="$(printf '%x\n' $TEMP)"
}

while :; do
	get_temp
	echo -e \\x${TEMP} > /dev/${HIDRAW}
	sleep 2.1
done