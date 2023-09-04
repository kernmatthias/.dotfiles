#!/bin/bash

exec xautolock -detectsleep \
    -time 3 -locker "scrot /tmp/screenshot.png && convert /tmp/screenshot.png -blur 0x10 /tmp/screenshotblur.png && i3lock -i /tmp/screenshotblur.png" \
    -notify 30 \
    -notifier "notify-send -u critical -t 10000 -- 'LOCKING screen in 30 seconds'"
