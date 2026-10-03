vim.pack.add({
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
})

require("render-markdown").setup({
        code = {enabled = false},
        bullet = { icons = { '', '', '', '' }, },
        link = { enabled = true, },
        heading = {enabled = false},
        paragraph = {enabled = false},
        sign = {enabled = false},
        indent = {enabled = false},
})
