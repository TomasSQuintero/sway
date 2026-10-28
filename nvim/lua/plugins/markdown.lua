vim.pack.add({
    { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
})

require("render-markdown").setup({
    bullet = { icons = { '', '', '', '' }, },
    link = { enabled = true, },
    paragraph = {enabled = false},
    sign = {enabled = false},
    -- code = {enabled = false},
    -- indent = {enabled = false},
    -- heading = {enabled = false},
    heading = {
        sign = false,
        icons = { '█ ', '▓ ', '▒ ', '░ ', '◆ ', '◇ ' },
        backgrounds = {},
    }
})
