
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

-- Create a new widget
local wifi_widget = wibox.widget.textbox()

-- Set the widget's text
wifi_widget:set_text("Loading...")

-- Create a function to update the widget's text
local function update_widget()
  -- Get the current wifi connection
  local connection = awful.util.get_network_info()

  -- Get the connected wifi's name
  local ssid = connection.ssid

  -- Get the connected wifi's data usage
  local data_usage = connection.received + connection.transmitted

  -- Set the widget's text
  wifi_widget:set_text(string.format("Connected to %s, %s used", ssid, data_usage))
end

-- Update the widget every second
awful.timer.new(1, update_widget, true):start()

-- Add the widget to the bar
awesome.wibar.get_global():add(wifi_widget)
