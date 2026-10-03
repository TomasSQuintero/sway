vim.pack.add({
  { src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
})

-- correct module name is "ibl", not "indent-blankline"
require("ibl").setup({})
