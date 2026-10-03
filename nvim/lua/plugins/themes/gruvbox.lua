vim.pack.add({
	{ src = "https://github.com/sainnhe/gruvbox-material" },
})

vim.g.gruvbox_material_background = 'soft'
vim.g.gruvbox_material_foreground = 'material'

local default_color = "gruvbox-material"
vim.cmd('colorscheme ' .. default_color)

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight yanked text",
  group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ higroup = "YankFlash", timeout = 200 })
  end,
})

vim.api.nvim_set_hl(0, "YankFlash", { bg = "#3daee9", fg = "#282828" })
