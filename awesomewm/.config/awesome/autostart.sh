#!/bin/bash

run() {
    if ! pgrep -f "$1"; then
        "$@" &
    fi
}

run "xss-lock -- i3lock -n -i &"

