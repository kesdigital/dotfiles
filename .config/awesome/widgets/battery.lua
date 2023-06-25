local awful = require("awful")
local watch = require("awful.widget.watch")
local wibox = require("wibox")
local clickable_container = require("widgets.clickable-container")
local gears = require("gears")
local dpi = require("beautiful").xresources.apply_dpi

local PATH_TO_ICONS = os.getenv("HOME") .. "/.config/awesome/icons/battery/"

-- ===================================================================
-- Widget Creation
-- ===================================================================

local icon_widget = wibox.widget {
   {
      id = "icon",
      widget = wibox.widget.imagebox,
      resize = true
   },
   layout = wibox.layout.fixed.horizontal
}

local icon_widget_button = clickable_container(wibox.container.margin(icon_widget, dpi(7), dpi(7), dpi(7), dpi(7)))
icon_widget_button:buttons(
   gears.table.join(
      awful.button({}, 1, nil,
         function()
            awful.spawn(apps.power_manager)
         end
      )
   )
)

-- Alternative to naughty.notify - tooltip. You can compare both and choose the preferred one
local battery_popup = awful.tooltip({
   objects = { icon_widget_button },
   mode = "outside",
   align = "left",
   referred_positions = { "right", "left", "top", "bottom" }
})

local function show_battery_warning()
   naughty.notify {
      icon = PATH_TO_ICONS .. "battery-alert.svg",
      icon_size = dpi(48),
      text = "Huston, we have a problem",
      title = "Battery is dying",
      timeout = 5,
      hover_timeout = 0.5,
      position = "top_right",
      bg = "#d32f2f",
      fg = "#EEE9EF",
      width = 248
   }
end

local last_battery_check = os.time()

watch('bash -c \'acpi -i | grep -E "^Battery [0-9]+: ([^%]+%)$|(.+remaining)$|(.+charged)$" --color=never\'', 5,
   function(_, stdout)
      local battery_info = {}
      local capacities = {}
      for s in stdout:gmatch("[^\r\n]+") do
         local status, charge_str, time = string.match(s, ".+: (%a+), (%d?%d?%d)%%,?.*")
         if status ~= nil then
            table.insert(battery_info, { status = status, charge = tonumber(charge_str) })
         else
            local cap_str = string.match(s, ".+:.+last full capacity (%d+)")
            table.insert(capacities, tonumber(cap_str))
         end
      end

      local capacity = 0
      for _, cap in ipairs(capacities) do
         capacity = capacity + cap
      end

      local charge = 0
      local status
      for i, batt in ipairs(battery_info) do
         if batt.charge >= charge then
            status = batt.status -- use most charged battery status
            -- this is arbitrary, and maybe another metric should be used
         end

         charge = charge + batt.charge * capacities[i]
      end
      charge = charge / capacity

      if (charge >= 0 and charge < 15) then
         if status ~= "Charging" and os.difftime(os.time(), last_battery_check) > 300 then
            -- if 5 minutes have elapsed since the last warning
            last_battery_check = time()

            show_battery_warning()
         end
      end

      local battery_icon_name = "battery-unknown"

      -- if status == "Charging" or status == "Full" then
      --    battery_icon_name = battery_icon_name .. "-charging"
      -- end

      local rounded_charge = math.floor(charge / 10) * 10

      if status then
         print(status .. " " .. rounded_charge)
      else
         print('unknown')
      end

      if not status then
         battery_icon_name = "battery-unknown"
      elseif status == "Full" then
         battery_icon_name = "battery-charging-100"
         -- Charging
      elseif status == "Charging" and rounded_charge == 100 then
         battery_icon_name = "battery-charging-100"
      elseif status == "Charging" and rounded_charge >= 90 then
         battery_icon_name = "battery-charging-90"
      elseif status == "Charging" and rounded_charge >= 80 then
         battery_icon_name = "battery-charging-80"
      elseif status == "Charging" and rounded_charge >= 60 then
         battery_icon_name = "battery-charging-60"
      elseif status == "Charging" and rounded_charge >= 50 then
         battery_icon_name = "battery-charging-50"
      elseif status == "Charging" and rounded_charge >= 30 then
         battery_icon_name = "battery-charging-30"
      elseif status == "Charging" and rounded_charge >= 20 then
         battery_icon_name = "battery-charging-20"
         -- Discharging
      elseif status == "Discharging" and rounded_charge >= 90 then
         battery_icon_name = "battery-discharging-90"
      elseif status == "Discharging" and rounded_charge >= 80 then
         battery_icon_name = "battery-discharging-80"
      elseif status == "Discharging" and rounded_charge >= 60 then
         battery_icon_name = "battery-discharging-60"
      elseif status == "Discharging" and rounded_charge >= 50 then
         battery_icon_name = "battery-discharging-50"
      elseif status == "Discharging" and rounded_charge >= 30 then
         battery_icon_name = "battery-discharging-30"
      elseif status == "Discharging" and rounded_charge >= 20 then
         battery_icon_name = "battery-discharging-20"
      elseif status == "Discharging" and rounded_charge <= 20 then
         battery_icon_name = "battery-alert"
      end

      icon_widget.icon:set_image(PATH_TO_ICONS .. battery_icon_name .. ".svg")
      -- Update popup text
      battery_popup.text = string.gsub(stdout, "\n$", "")
      collectgarbage("collect")
   end,
   icon_widget
)

return icon_widget_button
