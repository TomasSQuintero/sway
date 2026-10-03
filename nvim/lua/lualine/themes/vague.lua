-- lualine theme: vague
-- Based on the vague.nvim colorscheme palette
-- https://github.com/vague-theme/vague.nvim
--
-- Mode colors:
--   normal  -> purple  (parameter)
--   insert  -> green   (plus)
--   visual  -> blue    (hint)
--   replace -> red     (error)
--   command -> orange  (number)

local colors = {
  bg        = "#141415",
  bg_light  = "#1c1c24", -- inactiveBg
  line      = "#252530",
  fg        = "#cdcdcd",
  comment   = "#606079",

  purple    = "#bb9dbd", -- parameter  (normal)
  green     = "#7fa563", -- plus       (insert)
  blue      = "#7e98e8", -- hint       (visual)
  red       = "#d8647e", -- error      (replace)
  orange    = "#e0a363", -- number     (command)
  cyan    = "#b4d4cf", -- number     (command)
}

local vague = {}

vague.normal = {
  a = { bg = colors.purple, fg = colors.bg, gui = "bold" },
  b = { bg = colors.line, fg = colors.purple },
  c = { bg = colors.bg, fg = colors.fg },
}

vague.insert = {
  a = { bg = colors.green, fg = colors.bg, gui = "bold" },
  b = { bg = colors.line, fg = colors.green },
  c = { bg = colors.bg, fg = colors.fg },
}

vague.visual = {
  a = { bg = colors.cyan, fg = colors.bg, gui = "bold" },
  b = { bg = colors.line, fg = colors.cyan },
  c = { bg = colors.bg, fg = colors.fg },
}

vague.replace = {
  a = { bg = colors.red, fg = colors.bg, gui = "bold" },
  b = { bg = colors.line, fg = colors.red },
  c = { bg = colors.bg, fg = colors.fg },
}

vague.command = {
  a = { bg = colors.orange, fg = colors.bg, gui = "bold" },
  b = { bg = colors.line, fg = colors.orange },
  c = { bg = colors.bg, fg = colors.fg },
}

vague.inactive = {
  a = { bg = colors.bg_light, fg = colors.comment, gui = "bold" },
  b = { bg = colors.bg_light, fg = colors.comment },
  c = { bg = colors.bg_light, fg = colors.comment },
}

return vague
