function set_ldd_env() {
    export ARCH=arm
    export CROSS_COMPILE=arm-linux-gnueabihf-
}

function setup_displays() {
    xrandr --output DP-1-2.2 --auto --left-of eDP-1 --output DP-1-2.1.6 --auto --left-of DP-1-2.2
}

function setup_keyboard() {
    setxkbmap -layout de
}

