vim.cmd([[ set termguicolors ]])
vim.cmd([[ set t_Co=256 ]])

return {
  "brenoprata10/nvim-highlight-colors",
  config = function()
    require('nvim-highlight-colors').setup {
      render = 'background'
    }
  end,
}
