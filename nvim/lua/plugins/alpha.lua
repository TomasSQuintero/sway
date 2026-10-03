vim.pack.add({
	{ src = "https://github.com/goolord/alpha-nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
})

local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
	[[              ]],
	[[              ]],
	[[              ]],
	[[      ⣀⣠⣤⣤⣤⣤⣀⡀]],
	[[   ⣠⣤⢶⣻⣿⣻⣿⣿⣿⣿⣿⣿⣦⣤⣀]],
	[[  ⣼⣺⢷⣻⣽⣾⣿⢿⣿⣷⣿⣿⢿⣿⣿⣿⣇]],
	[[⠠⡍⢾⣺⢽⡳⣻⡺⣽⢝⢗⢯⣻⢽⣻⣿⣿⣿⣿⢿⡄]],
	[[⡨⣖⢹⠜⢅⢫⢊⢎⠜⢌⠣⢑⠡⣹⡸⣜⣯⣿⢿⣻⣷]],
	[[⢜⢔⡹⡭⣪⢼⠽⠷⠧⣳⢘⢔⡝⠾⠽⢿⣷⣿⣟⢷⣟]],
	[[⢸⢘⢼⠿⠟⠁    ⠃⠑⡌  ⠈⠙⠿⣷⢽⣻]],
	[[⢌⠂⠅       ⣲⣢⢂     ⠈⣯⠏]],
	[[⠐⠨⡂     ⡀⡔⠋⢻⣤⡀    ⢸⣯⠇]],
	[[⠈⣕⠝⠒⠄⠄⠒⢉⠪   ⢿⠜⠑⠢⠠⡒⡺⣿⠖]],
	[[ ⠐⠅⠁⡀ ⠐⢔⠁   ⢀⢇⢌   ⠸⠕]],
	[[  ⠂⠄⠄⠨⣔⡝⠼⡄⠂⣦⡆⣿⣲⠐⠑⠁  ]],
	[[      ⠃⢫⢛⣙⡊⣜⣏⡝⣝⠆]],
	[[      ⠈⠈⠁⠁⠁⠈⠈⠊]],
	[[              ]],
	[[              ]],
	[[              ]],
}

dashboard.section.buttons.val = {
	-- dashboard.button("f", "  find file", ":FzfLua files<CR>"),
	-- dashboard.button("a", "󰘓  find all", ":lua require('fzf-lua').files({ hidden = true, cmd = \"rg --files --hidden --glob '!.git/*'\" })<CR>"),
	-- dashboard.button("c", "  config", ":e ~/.config/nvim<CR>"),
	dashboard.button("f", "  find file", ":lua require('fzf-lua').files({ hidden = true, cmd = \"rg --files --hidden --glob '!.git/*'\" })<CR>"),
	dashboard.button("g", "  find text", ":FzfLua live_grep<CR>"),
	dashboard.button("n", "  new file", ":ene <BAR> startinsert<CR>"),
	dashboard.button("r", "  recent files", ":FzfLua oldfiles<CR>"),
	dashboard.button("q", "  quit", ":qa<CR>"),
}

dashboard.section.footer.val = {
	"every second counts",
}

dashboard.section.header.opts.hl = "header"
dashboard.section.buttons.opts.hl = "Keyword"
dashboard.section.footer.opts.hl = "Comment"

-- Disable scrolling on the alpha buffer
vim.api.nvim_create_autocmd("User", {
	pattern = "AlphaReady",
	callback = function()
		vim.opt_local.scrolloff = 0
		vim.keymap.set("n", "<ScrollWheelUp>", "<Nop>", { buffer = true })
		vim.keymap.set("n", "<ScrollWheelDown>", "<Nop>", { buffer = true })
		vim.keymap.set("n", "<ScrollWheelLeft>", "<Nop>", { buffer = true })
		vim.keymap.set("n", "<ScrollWheelRight>", "<Nop>", { buffer = true })
	end,
})

vim.api.nvim_create_autocmd("User", {
	pattern = "AlphaReady",
	callback = function()
		vim.opt_local.scrolloff = 0
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "alpha",
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.opt_local.signcolumn = "no"
		vim.opt_local.foldcolumn = "0"
	end,
})

alpha.setup(dashboard.opts)

