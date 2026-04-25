function fish_right_prompt
    # Only show if the command took more than 1 second (1000 ms)
    if test "$CMD_DURATION" -gt 1000
        # Calculate seconds with 1 decimal place
        set duration (math -s1 "$CMD_DURATION / 1000")

        set_color yellow
        echo -n "⏱ $duration"s
        set_color normal
    end
end

