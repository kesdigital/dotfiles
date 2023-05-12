-- Fuzzy Finder (files, lsp, etc)
-- health    ->    :checkhealth telescope
-- help      ->    :help telescope
-- cmd       ->    :Telescope

return {
  'nvim-telescope/telescope.nvim',
  version = '*',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local actions = require('telescope.actions')

    -- See `:help telescope` and `:help telescope.setup()`
    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
            ['<C-k>'] = actions.move_selection_previous,
            ['<C-j>'] = actions.move_selection_next,
            ['<C-c>'] = actions.close,
            ['<C-h>'] = "which_key"
          },
        },
      },
    }

    -- Enable telescope fzf native, if installed
    pcall(require('telescope').load_extension, 'fzf')

    local nmap = function(keys, func, desc)
      if desc then
        desc = 'Telescope: ' .. desc
      end

      vim.keymap.set('n', keys, func, { desc = desc })
    end

    -- See `:help telescope.builtin`
    -- nmap('<leader>?', require('telescope.builtin').oldfiles, '[?] Find recently opened files')
    -- nmap('<leader><space>', require('telescope.builtin').buffers, '[ ] Find existing buffers')
    nmap('<leader>/', function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, '[/] Fuzzily search in current buffer')

    -- nmap('<leader>ff', require('telescope.builtin').find_files, '[F]ind [F]iles')
    -- nmap('<leader>fb', require('telescope.builtin').buffers, '[F]ind [B]uffers')
    -- nmap('<leader>fh', require('telescope.builtin').help_tags, '[F]ind [H]elp')
    -- nmap('<leader>fw', require('telescope.builtin').grep_string, '[F]ind current [W]ord')
    -- nmap('<leader>fg', require('telescope.builtin').live_grep, '[F]ind with [G]rep')
    -- nmap('<leader>fd', require('telescope.builtin').diagnostics, '[F]ind [D]iagnostics')
    -- nmap('<leader>gs', require('telescope.builtin').git_status, '[G]it [S]tatus')
  end
}
