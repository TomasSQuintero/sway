-- Rose Pineé lualine theme
local colors = {
  base        = '#191724',
  surface     = '#1f1d2e',
  overlay     = '#26233a',
  muted       = '#6e6a86',
  subtle      = '#908caa',
  text        = '#e0def4',
  love        = '#ebbcba',
  gold        = '#f6c177',
  rose        = '#eb6f92',
  pine        = '#31748f',
  foam        = '#9ccfd8',
  iris        = '#c4a7e7',
  hl_low      = '#21202e',
  hl_med      = '#403d52',
  hl_high     = '#524f67',
}

return {
  normal = {
    a = { bg = colors.love,    fg = colors.base,    gui = 'bold' },
    b = { bg = colors.hl_med,  fg = colors.text },
    c = { bg = colors.overlay,  fg = colors.subtle },
  },
  insert = {
    a = { bg = colors.foam,    fg = colors.base,    gui = 'bold' },
    b = { bg = colors.hl_med,  fg = colors.text },
    c = { bg = colors.overlay,  fg = colors.subtle },
  },
  visual = {
    a = { bg = colors.gold,    fg = colors.base,    gui = 'bold' },
    b = { bg = colors.hl_med,  fg = colors.text },
    c = { bg = colors.overlay,  fg = colors.subtle },
  },
  replace = {
    a = { bg = colors.rose,    fg = colors.base,    gui = 'bold' },
    b = { bg = colors.hl_med,  fg = colors.text },
    c = { bg = colors.overlay,  fg = colors.subtle },
  },
  command = {
    a = { bg = colors.iris,    fg = colors.base,    gui = 'bold' },
    b = { bg = colors.hl_med,  fg = colors.text },
    c = { bg = colors.overlay,  fg = colors.subtle },
  },
  inactive = {
    a = { bg = colors.surface,  fg = colors.muted,   gui = 'bold' },
    b = { bg = colors.surface,  fg = colors.muted },
    c = { bg = colors.base,     fg = colors.muted },
  },
}
