return {
  "nvim-neo-tree/neo-tree.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    local keymap = vim.keymap

    -- Unless you are still migrating, remove the deprecated commands from v1.x
    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

    -- disable vim's built in netrw to prevent race conditions on startup
    vim.cmd([[ let g:loaded_netrw = 1 ]])
    vim.cmd([[ let g:loaded_netrwPlugin = 1 ]])

    keymap.set("n", "<leader>e", "<cmd>Neotree filesystem float toggle=true<cr>", { desc = "Explorer" })
    -- keymap.set("n", "<leader>fg", "<cmd>Neotree git_status float toggle=true<cr>", { desc = "[F]ile git status" })

    require('neo-tree').setup {
      enable_git_status = true,
      enable_modified_markers = true,
      enable_diagnostics = false,
      sort_case_insensitive = true,
      default_component_configs = {
        indent = {
          with_markers = false,
          with_expanders = true,
        },
        modified = {
          symbol = " ",
          highlight = "NeoTreeModified",
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
          folder_empty_open = "",
        },
        git_status = {
          symbols = {
            -- Change type
            added = "",
            deleted = "",
            modified = "",
            renamed = "",
            -- Status type
            untracked = "",
            ignored = "󰅚",
            unstaged = "",
            staged = "󰄴",
            conflict = "",
          },
        },
      },
      filesystem = {
        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            "node_modules",
            ".git",
            ".svelte-kit"
          }
        }
      },
      window = {
        position = "float"
      }
    }
  end,
}
