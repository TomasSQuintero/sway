
vim.pack.add({
	{ src = "https://github.com/vague2k/vague.nvim" },
})

local default_color = "vague"
vim.cmd('colorscheme ' .. default_color)
require "vague".setup({ transparent = true })
