local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")
local gears = require("gears")
local dpi = beautiful.xresources.apply_dpi

local modkey = require('keys').modkey

-- define module table
local tag_list = {}

tag_list.create = function(s)
   -- Create a wibox for each screen and add it
   local taglist_buttons = gears.table.join(
      awful.button({}, 1, function(t) t:view_only() end),
      awful.button({ modkey }, 1, function(t)
         if client.focus then
            client.focus:move_to_tag(t)
         end
      end),
      awful.button({}, 3, awful.tag.viewtoggle),
      awful.button({ modkey }, 3, function(t)
         if client.focus then
            client.focus:toggle_tag(t)
         end
      end),
      awful.button({}, 4, function(t) awful.tag.viewnext(t.screen) end),
      awful.button({}, 5, function(t) awful.tag.viewprev(t.screen) end)
   )

   awful.layout.layouts = {
      -- awful.layout.suit.floating,
      awful.layout.suit.tile,
      -- awful.layout.suit.tile.left,
      -- awful.layout.suit.tile.bottom,
      -- awful.layout.suit.tile.top,
      -- awful.layout.suit.fair,
      -- awful.layout.suit.fair.horizontal,
      -- awful.layout.suit.spiral,
      -- awful.layout.suit.spiral.dwindle,
      -- awful.layout.suit.max,
      -- awful.layout.suit.max.fullscreen,
      -- awful.layout.suit.magnifier,
      -- awful.layout.suit.corner.nw,
      -- awful.layout.suit.corner.ne,
      -- awful.layout.suit.corner.sw,
      -- awful.layout.suit.corner.se,
   }

   awful.tag({ "1", "2", "3", "4", "5", "6" }, s, awful.layout.layouts[1])

   return awful.widget.taglist {
      screen  = s,
      filter  = awful.widget.taglist.filter.all,
      buttons = taglist_buttons
   }
end

return tag_list
