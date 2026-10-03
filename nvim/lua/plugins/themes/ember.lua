vim.pack.add({
	{ src = "https://github.com/ember-theme/nvim" },
})

require("ember").setup({
  variant = "ember-soft", -- "ember" | "ember-soft" | "ember-light"
})

vim.cmd("colorscheme ember")
