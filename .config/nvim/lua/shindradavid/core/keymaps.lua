--[[

=====================================================================
============================= KEYMAPS ===============================
=====================================================================

-- See `:help vim.keymap.set()`

SPECIAL KEYS
<ESC>    - Escape
<CR>     - Carriage return aka <enter>
<TAB>    - Tab key
<C>      - <ctrl>
<S>      - <shift>
<S-TAB>  - While holding <shift> press <tab>
<M>      - Meta key aka <alt> or <option>
<UP>     - Up arrow key
<DOWN>   - Down arrow key
<SPACE>  - Space bar
<LEADER> - Leader, default to "/" but changed to " " <space>

--]]
local keymap = vim.keymap

local nmap = require('shindradavid.utils').nmap
local vmap = require('shindradavid.utils').vmap

keymap.set('n', '<leader>ln', '<cmd>set rnu!<CR>', { desc = 'Toggle relative line numbers' })

-- Keymaps for better default experience
keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
keymap.set('n', 'Q', '<NOP>')

-- navigate within insert mode
keymap.set('i', '<C-j>', '<Down>')
keymap.set('i', '<C-k>', '<Up>')
keymap.set('i', '<C-h>', '<Left>')
keymap.set('i', '<C-l>', '<Right>')

-- undo and redo
nmap('<C-z>', '<cmd>u<CR>', 'Undo')

-- go to  beginning and end
keymap.set('i', '<C-e>', '<END>', { desc = 'Go to the end of the line' })
keymap.set('i', '<C-b>', '<ESC>^i', { desc = 'Go to the beginning of the line' })

keymap.set('n', '<leader>wa', '<cmd>wa<CR>', { desc = 'Write all files' })
keymap.set('n', '<leader>wc', '<ESC><cmd>wa<CR>', { desc = 'Write current file' })

keymap.set('n', '<C-a>', '<cmd>%y+<CR>', { desc = 'Copy the whole file' })


-- natural copy paste
keymap.set('v', '<C-c>', '"+y', { silent = true })
keymap.set('n', '<C-c>', '"+yy', { silent = true })
keymap.set('v', '<C-v>', '"+p', { silent = true })
keymap.set('i', '<C-v>', '<Esc>"+pa', { silent = true })

-- Remap for dealing with word wrap
keymap.set('n', 'K', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Move selected line / block of text in visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

-- Diagnostic keymaps
keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
keymap.set('n', '<leader>dm', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
keymap.set('n', '<leader>dl', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Keep highlight when (de)indenting in visual mode
keymap.set('v', '<', '<gv', { desc = 'De indent' })
keymap.set('v', '>', '>gv', { desc = 'Indent' })

-- toggle spellcheck
keymap.set('n', '<F2>', '<cmd>set invspell<CR>', { desc = 'Toggle spell check' })

-- delete without saving to register
keymap.set("n", "x", '"_x', { silent = true })
keymap.set("n", "X", '"_X', { silent = true })
keymap.set("v", "x", '"_x', { silent = true })
keymap.set("v", "X", '"_X', { silent = true })
keymap.set("n", "d", '"_d')
keymap.set("v", "d", '"_d')

-- Don't yank on visual paste
keymap.set("v", "p", '"_dP', { silent = true })
