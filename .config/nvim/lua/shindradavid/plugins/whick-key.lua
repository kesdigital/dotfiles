return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  lazy = true,
  config = function()
    local which_key = require('which-key')

    local opts = {
      plugins = {
        marks = false,     -- shows a list of your marks on ' and `
        registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
          enabled = true,
          suggestions = 20,
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
          operators = false,    -- adds help for operators like d, y, ...
          motions = false,      -- adds help for motions
          text_objects = false, -- help for text objects triggered after entering an operator
          windows = false,      -- default bindings on <c-w>
          nav = false,          -- misc bindings to work with windows
          z = false,            -- bindings for folds, spelling and others prefixed with z
          g = false,            -- bindings for prefixed with g
        },
      },
      operators = { gc = "Comments" }, -- show the currently pressed key and its label as a message in the command line
      icons = {
        breadcrumb = "»",             -- symbol used in the command line area that shows your active key combo
        separator = "➜",             -- symbol used between a key and it's label
        group = "+",                   -- symbol prepended to a group
      },
      popup_mappings = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>",   -- binding to scroll up inside the popup
      },
      window = {
        border = "none",          -- none, single, double, shadow
        position = "bottom",      -- bottom, top
        margin = { 2, 0, 2, 0 },  -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
        zindex = 1000,            -- positive value to position WhichKey above other floating windows.
      },
      layout = {
        height = { min = 4, max = 25 },                                             -- min and max height of the columns
        width = { min = 20, max = 50 },                                             -- min and max width of the columns
        spacing = 3,                                                                -- spacing between columns
        align = "center",                                                           -- align columns left, center or right
      },
      ignore_missing = false,                                                       -- enable this to hide mappings for which you didn't specify a label
      hidden = { "<silent>", "<cmd>", "<Cmd>", "<cr>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
      show_help = true,                                                             -- show help message on the command line when the popup is visible
      show_keys = true,
      triggers = "auto",                                                            -- automatically setup triggers
      triggers_blacklist = {
        i = { "j", "k" },
        v = { "j", "k" },
      },
      -- Disabled by default for Telescope
      --[[ disable = {
        buftypes = {},
        filetypes = { "TelescopePrompt" },
      } ]]
    }

    local mappings = {
      ["<tab>"] = { "<cmd>BufferLineCycleNext<cr>", "Go to next buffer" },
      ["<s-tab>"] = { "<cmd>BufferLineCyclePrev<cr>", "Go to previous buffer" },
      ["<leader>"] = {
        [";"] = { "<cmd>ToggleTerm<cr>", "Toggle terminal" },
        b = {
          name = "Buffers",
          c = { "<cmd>bd<cr>", "Close current" },
          w = {
            name = "Write",
            c = { "<cmd>w<cr>", "Current" },
            a = { "<cmd>wa<cr>", "All" }
          },
          f = { "<cmd>Format<cr>", "Format current" },
          ["1"] = { "<cmd>BufferLineGoToBuffer 1<cr>", "First" },
          ["2"] = { "<cmd>BufferLineGoToBuffer 2<cr>", "Second" },
          ["3"] = { "<cmd>BufferLineGoToBuffer 3<cr>", "Third" },
          ["4"] = { "<cmd>BufferLineGoToBuffer 4<cr>", "Fourth" },
          ["5"] = { "<cmd>BufferLineGoToBuffer 5<cr>", "Fifth" },
          ["6"] = { "<cmd>BufferLineGoToBuffer 6<cr>", "Sixth" },
        },
        c = {
          name = "Comment",
          l = { "<cmd>lua require('Comment.api').toggle.linewise.current()<cr>", "linewise" },
          b = { "<cmd>lua require('Comment.api').toggle.blockwise.current()<cr>", "blockwise" },
        },
        f = {
          name = "Find",
          b = { "<cmd>Telescope buffers<cr>", "Buffers" },
          f = { "<cmd>Telescope find_files<cr>", "Files" },
          r = { "<cmd>Telescope registers<cr>", "Registers" },
          t = { "<cmd>Telescope live_grep<cr>", "Text" },
          w = { "<cmd>Telescope grep_string<cr>", "Word" },
          d = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
          h = { "<cmd>Telescope help_tags<cr>", "Help tags" },
        }
      }
    }

    which_key.setup(opts)
    which_key.register(mappings)
  end
}
