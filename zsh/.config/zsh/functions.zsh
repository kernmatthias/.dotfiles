function set_ldd_env() {
    export ARCH=arm
    export CROSS_COMPILE=arm-linux-gnueabihf-
}

function setup_displays() {
    xrandr --output eDP-1 --auto --output DP-1-2.2 --auto --left-of eDP-1 --primary --output DP-1-2.1.6 --auto --left-of DP-1-2.2
}

function setup_displays_nointegrated() {
    xrandr --output eDP-1 --off --output DP-1-2.2 --auto --primary --output DP-1-2.1.6 --auto --left-of DP-1-2.2
}

function setup_displays_nvidia_nointegrated() {
    xrandr --output eDP-1-1 --off --output DP-2.2 --auto --primary --output DP-2.1.6 --auto --left-of DP-2.2
}

function setup_keyboard() {
    setxkbmap -layout de nodeadkeys
}

function switch_hybrid() {
    optimus-manager --switch hybrid --no-confirm
}

function switch_integrated() {
    optimus-manager --switch integrated --no-confirm
}

function switch_nvidia() {
    optimus-manager --switch nvidia --no-confirm
}

function switch_startup_hybrid() {
	sudo ln -sf /etc/optimus-manager/startup_hybrid.conf /etc/optimus-manager/optimus-manager.conf
}

function switch_startup_integrated() {
	sudo ln -sf /etc/optimus-manager/startup_integrated.conf /etc/optimus-manager/optimus-manager.conf
}

function switch_startup_nvidia() {
	sudo ln -sf /etc/optimus-manager/startup_nvidia.conf /etc/optimus-manager/optimus-manager.conf
}

