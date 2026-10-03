-- Gruvbox Material (Dark, Soft) theme for lualine
-- Palette reference: https://github.com/sainnhe/gruvbox-material

local colors = {
  bg0        = '#32302f', -- soft background
  bg1        = '#3c3836',
  bg2        = '#45403d',
  bg3        = '#5a524c',
  bg4        = '#665c54',
  fg0        = '#d4be98',
  fg1        = '#ddc7a1',
  grey       = '#7c6f64',

  red        = '#ea6962',
  orange     = '#e78a4e',
  yellow     = '#d8a657',
  green      = '#a9b665',
  teal       = '#89b482', -- aqua
  blue       = '#7daea3',
  purple     = '#d3869b',
  white      = '#fbf1c7',
}

local gruvbox_material_soft = {
  normal = {
    a = { bg = colors.green, fg = colors.bg0, gui = 'bold' },
    b = { bg = colors.bg3,   fg = colors.fg1 },
    c = { bg = colors.bg1,   fg = colors.fg0 },
  },
  insert = {
    a = { bg = colors.white, fg = colors.bg0, gui = 'bold' },
    b = { bg = colors.bg3, fg = colors.fg1 },
    c = { bg = colors.bg1, fg = colors.fg0 },
  },
  visual = {
    a = { bg = colors.blue, fg = colors.bg0, gui = 'bold' },
    b = { bg = colors.bg3,  fg = colors.fg1 },
    c = { bg = colors.bg1,  fg = colors.fg0 },
  },
  replace = {
    a = { bg = colors.orange, fg = colors.bg0, gui = 'bold' },
    b = { bg = colors.bg3,    fg = colors.fg1 },
    c = { bg = colors.bg1,    fg = colors.fg0 },
  },
  command = {
    a = { bg = colors.teal, fg = colors.bg0, gui = 'bold' },
    b = { bg = colors.bg3,  fg = colors.fg1 },
    c = { bg = colors.bg1,  fg = colors.fg0 },
  },
  terminal = {
    a = { bg = colors.purple, fg = colors.bg0, gui = 'bold' },
    b = { bg = colors.bg3,    fg = colors.fg1 },
    c = { bg = colors.bg1,    fg = colors.fg0 },
  },
  inactive = {
    a = { bg = colors.bg1, fg = colors.grey },
    b = { bg = colors.bg1, fg = colors.grey },
    c = { bg = colors.bg1, fg = colors.grey },
  },
}

return gruvbox_material_soft
