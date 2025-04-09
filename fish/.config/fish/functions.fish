function switch_startup_hybrid
    sudo envycontrol -s hybrid --verbose --dm lightdm
end

function switch_startup_integrated
    sudo envycontrol -s integrated --dm lightdm --verbose
end

function switch_startup_nvidia
     sudo envycontrol -s nvidia --force-comp --dm lightdm --verbose --force
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

function setup_work_nvidia
	xrandr --output DP-2.8 --auto || return
	xrandr --output DP-2.1 --auto || return
    xrandr --output eDP-1-1 --mode 2560x1600 --rate 60 --output DP-2.1 --auto --left-of eDP-1-1 --primary --output DP-2.8 --auto --left-of DP-2.1
end

function setup_lp_integrated
    xrandr --output eDP-1 --mode 2560x1600 --rate 60
end
