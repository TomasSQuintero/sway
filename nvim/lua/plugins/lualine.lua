vim.pack.add({
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/nvim-lualine/lualine.nvim'
})

vim.o.showcmdloc = "statusline"

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'gb',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = { "aerial" },
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
      refresh_time = 16, -- ~60fps
      events = {
        'WinEnter',
        'BufEnter',
        'BufWritePost',
        'SessionLoadPost',
        'FileChangedShellPost',
        'VimResized',
        'Filetype',
        'CursorMoved',
        'CursorMovedI',
        'ModeChanged',
      },
    }
  },
  sections = {
    lualine_a = {'mode'},
    -- lualine_b = {'filesize'},
    lualine_b = {
        function()
            return vim.fn.line('.') .. '/' .. vim.fn.line('$')
        end
    },
    lualine_c = {{
      'filename',
      -- 0 for filename, 1 for relative path
      -- 2/3 for absolute, 4 for filename and parent dir
      -- path = 2,
    }},
    --option 1, w/o date and time
    lualine_x = {'%S'},
    lualine_y = {'progress'},
    lualine_z = {'location', 'selectioncount'},
    --option 2, w/ date and time
    -- lualine_x = {'progress'},
    -- lualine_y = {'location'},
    -- lualine_z = {{
    --   'datetime',
    --   style = ("%A %d.%m - %H:%M:%S")
    -- }},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
