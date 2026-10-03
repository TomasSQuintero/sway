vim.pack.add({
  { src = "https://github.com/dkarter/bullets.vim" },
}, { load = true })

vim.g.bullets_enabled_file_types = { 'markdown', 'text', 'gitcommit', 'scratch', 'lua' }
vim.g.bullets_set_mappings = 0

local map = vim.keymap.set

map({'n', 'v'}, '<M-c>', '<Plug>(bullets-toggle-checkbox)', { desc = 'Toggle checkbox', remap = true })
map('i', '<CR>', '<Plug>(bullets-newline)', { desc = 'New bullet point', remap = true })
map('i', '<S-Tab>', '<Plug>(bullets-promote)', { desc = 'Outdent Bullet', remap = true })
map('i', '<Tab>', '<Plug>(bullets-demote)', { desc = 'Indent Bullet', remap = true })
