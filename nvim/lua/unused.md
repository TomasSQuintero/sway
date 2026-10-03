-- leader d to insert the date, already formatted
vim.keymap.set('n', '<leader>d', "i<C-R>= strftime('%Y-%m-%d')<CR> - ", { noremap = true, silent = true })
-- vim.keymap.set('n', '<leader>d', "i<C-R>= strftime('%Y-%m-%d')<CR> ", { noremap = true, silent = true })
-- vim.keymap.set('n', '<leader>d', "i<C-R>= strftime('%Y-%m-%d')<CR><Esc>", { noremap = true, silent = true })

-- unused, Switch to the next split using 'gs'
-- vim.keymap.set('n', 'gs', '<C-w>w', { noremap = true, silent = true })

-- not working, formatting markdown link
-- vim.keymap.set('v', '<leader>k', 'i[]()2hi', { noremap = true, silent = true })

-- unused, paste to end and return cursor
-- vim.keymap.set('n', '<leader>m', "ddGp''", { noremap = true })

-- deprecated, leader y to paste to clipboard
-- vim.keymap.set("n", "<leader>y", '"+y', { noremap = true, silent = true })
-- vim.keymap.set("v", "<leader>y", '"+y', { noremap = true, silent = true })

-- deprecated, literally no idea what this one was for
-- vim.keymap.set('n', '<leader>p', 'llpo[]()2hi', { noremap = true, silent = true })

-- insert line above and below without leaving normal mode
-- vim.keymap.set("n", "<leader>o", 'o<ESC>', { noremap = true, silent = true })
-- vim.keymap.set("n", "<leader>O", 'O<ESC>', { noremap = true, silent = true })

-- U to redo
-- vim.keymap.set('n', '<S-u>', '<C-r>', { desc = 'Redo' })

-- identar todo el archivo
-- vim.keymap.set('n', '<leader>0', 'm`gg=G<Esc>``', { noremap = true, silent = true })

-- toggle markdown rendering
-- vim.keymap.set('n', '<leader>m', ':RenderMarkdown toggle<CR>', { noremap = true, silent = true })

-- inserting checkboxes with control + c (older version)
-- vim.keymap.set('i', '<C-c>', '- [ ] ', { noremap = true, silent = true })

-- markdown checkbox formatting (newer version, alt + c)
-- vim.keymap.set('v', '<A-c>', ":norm I- [ ] <CR>A", { noremap = true, silent = true })
-- vim.keymap.set('i', '<A-c>', 'I- [ ] ', { noremap = true, silent = true })

-- para cerrar el buffer, para ir cambiando esta leader fb de telescope
-- vim.keymap.set('n', '<leader>bd', ':bd<CR>', { noremap = true, silent = true })

-- select entire buffer
-- vim.keymap.set('n', '<C-a>', 'ggVG', { noremap = true, silent = true })

-- increase/decrease number with alt a and x
-- vim.keymap.set('n', '<M-a>', '<C-a>', { desc = 'Increment number' })
-- vim.keymap.set('v', '<M-a>', '<C-a>', { desc = 'Increment number' })
-- vim.keymap.set('v', 'g<M-a>', 'g<C-a>', { desc = 'Increment numbers sequentially' })
-- vim.keymap.set('n', '<M-x>', '<C-x>', { desc = 'Decrement number' })
-- vim.keymap.set('v', '<M-x>', '<C-x>', { desc = 'Decrement number' })
-- vim.keymap.set('v', 'g<M-x>', 'g<C-x>', { desc = 'Decrement numbers sequentially' })

init.lua
___

-- Make background transparent
-- vim.o.termguicolors = false
-- vim.cmd [[highlight Normal ctermbg=none guibg=none]]
-- vim.cmd [[highlight NonText ctermbg=none guibg=none]]
-- vim.cmd [[highlight NormalNC ctermbg=none guibg=none]]
-- vim.cmd [[highlight MsgArea ctermbg=none guibg=none]]
-- vim.cmd [[highlight TelescopeNormal ctermbg=none guibg=none]]
-- vim.cmd [[highlight FloatBorder ctermbg=none guibg=none]]
-- vim.cmd [[highlight Pmenu ctermbg=none guibg=none]]
-- vim.cmd [[highlight StatusLine ctermbg=none guibg=none]]

plugins/mini.move.lua
___

-- mini.move plugin, for moving lines/blocks visually
vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.move" },
})

require('mini.move').setup()

plugins/cmd-palette.lua
___

-- cmdpalette.nvim, floating command palette bound to ':'
vim.pack.add({
	{ src = "https://github.com/hachy/cmdpalette.nvim" },
})

require("cmdpalette").setup({
  win = {
    height = 0.3,
    width = 0.3,
    max_width = 120,
    border = "rounded",
    row_off = -2,
    title = "",
    title_pos = "center",
  },
  sign = {
    text = ":",
  },
  buf = {
    filetype = "vim",
    syntax = "vim",
  },
  delete_confirm = true,
  show_title = true,
})

vim.keymap.set("n", ":", "<Plug>(cmdpalette)")

lua/plugins/themes/ember.lua
___

-- ember colorscheme
vim.pack.add({
	{ src = "https://github.com/ember-theme/nvim" },
})

require("ember").setup({
  variant = "ember-soft", -- "ember" | "ember-soft" | "ember-light"
})

vim.cmd("colorscheme ember")

lua/plugins/noice.lua
___

-- noice.nvim, overrides UI for cmdline/messages/popupmenu (with nui.nvim + nvim-notify)
vim.pack.add({
	{ src = "https://github.com/folke/noice.nvim" },
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
	{ src = "https://github.com/rcarriga/nvim-notify" },
})

require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
})

-- para usar un template, en este caso para libros
vim.api.nvim_create_user_command("Book", function()
  vim.cmd("0r ~/notes/96-templates/book.md")
end, {})
