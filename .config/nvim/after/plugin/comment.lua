local api = require('Comment.api')

-- vim.keymap.set('n', '<leader>cl', api.toggle.linewise.current, { desc = 'Toggle comment for lime (linewise)' })
-- vim.keymap.set('n', '<leader>cb', api.toggle.blockwise.current, { desc = 'Toggle comment for line (blockwise) ' })

local esc = vim.api.nvim_replace_termcodes(
  '<ESC>', true, false, true
)

vim.keymap.set('x', '<leader>cb', function()
  vim.api.nvim_feedkeys(esc, 'nx', false)
  api.toggle.blockwise(vim.fn.visualmode())
end, { desc = 'Toggle comment for selection (blockwise)' })

vim.keymap.set('x', '<leader>cl', function()
  vim.api.nvim_feedkeys(esc, 'nx', false)
  api.toggle.linewise(vim.fn.visualmode())
end, { desc = 'Toggle comment for selection (linewise)' })
