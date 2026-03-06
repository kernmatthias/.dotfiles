local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")

-- 1. Create the text widget
local cpu_temp_widget = wibox.widget.textbox()
cpu_temp_widget.text = " CPU: --°C "

-- 2. Create a function to update the temperature
local function update_temp()
	-- This command extracts the temperature from 'Package id 0' or 'Core 0'
	-- The regex handles different outputs from the 'sensors' command

	local cmd = "sensors | awk '/Package id 0/ {print $4} /CPUTIN/ {print $2}' | sed 's/+//;s/°C//' | head -n 1"

	awful.spawn.easy_async_with_shell(
		cmd,
		--"sensors | grep -E 'Package id 0' | awk '{print $4}' | sed 's/+//;s/°C//'",
		function(stdout)
			local temp = tonumber(stdout)
			if temp then
				-- Optional: Change color if it's too hot
				local color = "#a6a6a6"
				if temp > 75 then
					color = "#ff0000"
				elseif temp > 60 then
					color = "#ffaa00"
				end

				cpu_temp_widget:set_markup(
					"<span foreground='" .. color .. "'>CPU: " .. math.floor(temp) .. "°C</span>"
				)
			else
				cpu_temp_widget:set_text("CPU: ERR")
			end
		end
	)
end

-- 3. Create a timer to update every 5 seconds
gears.timer({
	timeout = 2.5,
	call_now = true,
	autostart = true,
	callback = update_temp,
})

return cpu_temp_widget
