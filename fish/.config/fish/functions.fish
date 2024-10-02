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

function connect_fh_vpn
	sudo pon ppp0

	set max_retry 5
	set counter 1

	while [ $counter -lt $max_retry ]
		if sudo ip route add 10.24.0.23 dev ppp0; then
			echo "Success!"
			break
		else
		sleep 3
		set counter (math $counter + 1)
		echo "Trying again. Try #$counter"
		end
	end

	if [ $counter -gt $max_retry ]
		echo "Failed to add route"
	end
end

function v
    if test $argv[1]
        $EDITOR $argv
    else
        $EDITOR ./
    end
end
