-- ===================================================================
-- Initialization
-- ===================================================================


local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local offsetx = dpi(56)
local offsety = dpi(300)
local screen = awful.screen.focused()
local icon_dir = gears.filesystem.get_configuration_dir() .. "/icons/sound/" .. "/"

local watch = require("awful.widget.watch")

local sound_widget = {}

sound_widget.create = function()
   return watch([[bash -c "amixer sget Master | grep 'Right:' | awk -F '[][]' '{print $2}'| sed 's/[^0-9]//g'"]], 5,
      function(widget, stdout)
         local volume = tonumber(stdout)
         widget:set_text("VOL: " .. volume .. "%")
      end)
end

return sound_widget
