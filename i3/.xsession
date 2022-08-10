# Disable DPMS off the screen?
xset -dpms
xset s off

# Disable the bell
xset -b

# enforce correct locales from the beginning
unset LC_ALL
export LANG=en_US.UTF-8
export LC_MESSAGES=C
export LC_TIME=de_AT.UTF-8

# set background color
xsetroot -solid "#000000"

# enable core dumps in case something goes wrong
ulimit -c unlimited

# start i3 and log to ~/.i3/logfile
echo "Starting at $(date)" >> ~/.i3/logfile
exec /usr/bin/i3 -V -d all >> ~/.i3/logfile

