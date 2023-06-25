--      ██████╗  █████╗ ███████╗████████╗███████╗██╗
--      ██╔══██╗██╔══██╗██╔════╝╚══██╔══╝██╔════╝██║
--      ██████╔╝███████║███████╗   ██║   █████╗  ██║
--      ██╔═══╝ ██╔══██║╚════██║   ██║   ██╔══╝  ██║
--      ██║     ██║  ██║███████║   ██║   ███████╗███████╗
--      ╚═╝     ╚═╝  ╚═╝╚══════╝   ╚═╝   ╚══════╝╚══════╝

-- ===================================================================
-- Initialization
-- ===================================================================


local awful = require("awful")
local gears = require("gears")

local gruvbox = {}

local modkey = "Mod4"


-- ===================================================================
-- gruvbox setup
-- ===================================================================


gruvbox.initialize = function()
   -- Import components
   require("components.gruvbox.wallpaper")
   require("components.exit-screen")
   require("components.volume-adjust")
   require("components.gruvbox.titlebar")

   -- Import panels
   local left_panel = require("components.gruvbox.left-panel")
   local top_panel = require("components.gruvbox.top-panel")

   local icon_dir = gears.filesystem.get_configuration_dir() .. "/icons/tags/gruvbox/"

   -- Set up each screen (add tags & panels)
   awful.screen.connect_for_each_screen(function(s)
      -- for i = 1, 5, 1
      -- do
      --    awful.tag.add(i, {
      --       -- icon = gears.filesystem.get_configuration_dir() .. "/icons/tags/gruvbox/" .. i .. ".png",
      --       icon_only = false,
      --       layout = awful.layout.suit.tile,
      --       screen = s,
      --       selected = i == 1
      --    })
      -- end

      -- Only add the left panel on the primary screen
      -- if s.index == 1 then
      --    left_panel.create(s)
      -- end

      -- Add the top panel to every screen
      top_panel.create(s)
   end)

   -- -- set initally selected tag to be active
   -- local initial_tag = awful.screen.focused().selected_tag
   -- awful.tag.seticon(icon_dir .. initial_tag.name .. ".png", initial_tag)
end

return gruvbox
