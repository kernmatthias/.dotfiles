#!/bin/bash

run() {
    if ! pgrep -f "$1"; then
        "$@" &
    fi
}

run "${HOME}/.config/awesome/locker.sh"

