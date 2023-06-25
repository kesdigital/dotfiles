--      ████████╗██╗  ██╗███████╗███╗   ███╗███████╗
--      ╚══██╔══╝██║  ██║██╔════╝████╗ ████║██╔════╝
--         ██║   ███████║█████╗  ██╔████╔██║█████╗
--         ██║   ██╔══██║██╔══╝  ██║╚██╔╝██║██╔══╝
--         ██║   ██║  ██║███████╗██║ ╚═╝ ██║███████╗
--         ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚══════╝

-- ===================================================================
-- Initialization
-- ===================================================================


local xresources = require("beautiful.xresources")
local gears = require("gears")
local dpi = xresources.apply_dpi

-- define module table
local theme = {}


-- ===================================================================
-- Theme Variables
-- ===================================================================


theme.name = "gruvbox"

-- Font
theme.font = "Hack Nerd Font 10"
theme.title_font = "Hack Nerd Font 11"

-- Background
theme.bg_normal = "#1d2021"
theme.bg_dark = "#000000"
theme.bg_focus = "#282828"
theme.bg_urgent = "#cc241d"
theme.bg_minimize = "#3c3836"

-- Foreground
theme.fg_normal = "#fbf1c7"
theme.fg_focus = "#ebdbb2"
theme.fg_urgent = "#fbf1c7"
theme.fg_minimize = "#fbf1c7"

-- Window Gap Distance
theme.useless_gap = dpi(7)

-- Show Gaps if Only One Client is Visible
theme.gap_single_client = true

-- Window Borders
theme.border_width = dpi(2)
theme.border_normal = theme.bg_normal
theme.border_focus = "#689d6a"
theme.border_marked = theme.fg_urgent

-- Taglist
theme.taglist_bg_empty = theme.bg_normal
theme.taglist_bg_occupied = "#fbf1c71a"
theme.taglist_bg_urgent = "#cc241d99"
theme.taglist_bg_focus = "#689d6a99"

-- Tasklist
theme.tasklist_font = theme.font

theme.tasklist_bg_normal = theme.bg_normal
theme.tasklist_bg_focus = "#3c3836"
theme.tasklist_bg_urgent = theme.bg_urgent

theme.tasklist_fg_focus = theme.fg_focus
theme.tasklist_fg_urgent = theme.fg_urgent
theme.tasklist_fg_normal = theme.fg_normal

-- Panel Sizing
theme.left_panel_width = dpi(42)
theme.top_panel_height = dpi(30)

-- Notification Sizing
theme.notification_max_width = dpi(350)

-- System Tray
theme.bg_systray = theme.bg_normal
theme.systray_icon_spacing = dpi(5)

-- Titlebars
theme.titlebars_enabled = true


-- ===================================================================
-- Icons
-- ===================================================================

local icon_dir                                        = gears.filesystem.get_configuration_dir() .. "/icons/titlebar/"

theme.titlebar_bg_focus                               = theme.bg_normal
theme.titlebar_bg_normal                              = theme.bg_normal
theme.titlebar_fg_focus                               = theme.fg_normal
theme.titlebar_fg_normal                              = theme.fg_focus

-- Close Button
theme.titlebar_close_button_normal                    = icon_dir .. 'normal.svg'
theme.titlebar_close_button_focus                     = icon_dir .. 'close_focus.svg'
theme.titlebar_close_button_normal_hover              = icon_dir .. 'close_focus_hover.svg'
theme.titlebar_close_button_focus_hover               = icon_dir .. 'close_focus_hover.svg'

-- Minimize Button
theme.titlebar_minimize_button_normal                 = icon_dir .. 'normal.svg'
theme.titlebar_minimize_button_focus                  = icon_dir .. 'minimize_focus.svg'
theme.titlebar_minimize_button_normal_hover           = icon_dir .. 'minimize_focus_hover.svg'
theme.titlebar_minimize_button_focus_hover            = icon_dir .. 'minimize_focus_hover.svg'

-- Maximized Button (While Window is Maximized)
theme.titlebar_maximized_button_normal_active         = icon_dir .. 'normal.svg'
theme.titlebar_maximized_button_focus_active          = icon_dir .. 'maximized_focus.svg'
theme.titlebar_maximized_button_normal_active_hover   = icon_dir .. 'maximized_focus_hover.svg'
theme.titlebar_maximized_button_focus_active_hover    = icon_dir .. 'maximized_focus_hover.svg'

-- Maximized Button (While Window is not Maximized)
theme.titlebar_maximized_button_normal_inactive       = icon_dir .. 'normal.svg'
theme.titlebar_maximized_button_focus_inactive        = icon_dir .. 'maximized_focus.svg'
theme.titlebar_maximized_button_normal_inactive_hover = icon_dir .. 'maximized_focus_hover.svg'
theme.titlebar_maximized_button_focus_inactive_hover  = icon_dir .. 'maximized_focus_hover.svg'




-- Define layout icons
theme.layout_tile = "~/.config/awesome/icons/layouts/tiled.png"
theme.layout_floating = "~/.config/awesome/icons/layouts/floating.png"
theme.layout_max = "~/.config/awesome/icons/layouts/maximized.png"

theme.icon_theme = "Tela-dark"

-- return theme
return theme
