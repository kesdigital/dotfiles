-- local awful = require("awful")
-- local wibox = require("wibox")
-- local gears = require("gears")
local watch = require("awful.widget.watch")

local ram_widget = {}

ram_widget.create = function()
   return watch('bash -c "free -h --si --kilo | grep Mem"', 5, function(widget, stdout)
      -- print(stdout)
      local total, used = stdout:match("(%d+.%d+%a?)%s+(%d+.%d+%a?)")
      widget:set_text("RAM: " .. used .. "/" .. total)
   end)
end

-- function ram_widget.create()
-- local widget = wibox.widget.textbox()

-- function widget.update()
--    local handle = io.popen("free -h --si --bytes | grep Mem")
--    local result = handle:read("*a")
--    handle:close()
--
--    local total, used = result:match("(%d+%.%d+%a?)%s+(%d+%.%d+%a?)")
--    widget:set_text("RAM: " .. used .. "/" .. total)
-- end
--

-- local function update_widget()
--    local handle = io.popen("free -h --si --bytes | grep Mem")
--    local result = handle:read("*a")
--    handle:close()
--
--    local total, used = result:match("(%d+%.%d+%a?)%s+(%d+%.%d+%a?)")
--    widget:set_text("RAM: " .. used .. "/" .. total)
-- end

-- Call update() initially to set the initial value
-- widget.update()

-- Create a timer to update the widget every 5 seconds (adjust as needed)
-- local ram_timer = gears.timer {
--    timeout = 5, -- Interval in seconds
--    autostart = true,
--    callback = update_widget
-- }

-- return widget
-- end

return ram_widget
