function switch_hybrid
    optimus-manager --switch hybrid --no-confirm
end

function setup_displays
	xrandr --output DP-2.2 --auto || return
	xrandr --output DP-2.1.6 --auto || return
    xrandr --output eDP-1-1 --auto --output DP-2.2 --mode 2560x1440 --rate 120 --primary --output DP-2.1.6 --mode 2560x1440 --rate 120 --left-of DP-2.2
end

function setup_displays_nointegrated
	# xrandr --output eDP-1-1 --off --output DP-2.2 --auto --primary --output DP-2.1.6 --auto --left-of DP-2.2
	# sleep 5
	xrandr --output DP-2.2 --auto || return
	xrandr --output DP-2.1.6 --auto || return
    xrandr --output eDP-1-1 --off --output DP-2.2 --mode 2560x1440 --rate 120 --primary --output DP-2.1.6 --mode 2560x1440 --rate 120 --left-of DP-2.2
end

function switch_integrated
    optimus-manager --switch integrated --no-confirm
end

function switch_nvidia
    optimus-manager --switch nvidia --no-confirm
end

function switch_startup_hybrid
	sudo ln -sf /etc/optimus-manager/startup_hybrid.conf /etc/optimus-manager/optimus-manager.conf
end

function switch_startup_integrated
	sudo ln -sf /etc/optimus-manager/startup_integrated.conf /etc/optimus-manager/optimus-manager.conf
end

function switch_startup_nvidia
	sudo ln -sf /etc/optimus-manager/startup_nvidia.conf /etc/optimus-manager/optimus-manager.conf
end

function set_cc_env
	set ARCH "arm"
	set CROSS_COMPILE "arm-linux-gnueabihf-"
end
