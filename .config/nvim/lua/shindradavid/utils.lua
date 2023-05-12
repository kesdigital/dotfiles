local M = {}

function M.nmap(keys, func, desc)
  vim.keymap.set('n', keys, func, { desc = desc })
end

function M.vmap(keys, func, desc)
  vim.keymap.set('v', keys, func, { desc = desc })
end

function M.imap(keys, func, desc)
  vim.keymap.set('i', keys, func, { desc = desc })
end

return M
