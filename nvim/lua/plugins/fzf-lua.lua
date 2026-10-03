vim.pack.add({
  { src = "https://github.com/ibhagwan/fzf-lua" },
})

local fzf = require('fzf-lua')

fzf.setup({
  winopts = {
    height     = 0.90,       -- window height (0-1 = % of screen, >=1 = fixed lines)
    width      = 0.90,       -- window width  (0-1 = % of screen, >=1 = fixed cols)
    row        = 0.35,       -- row position (0=top, 1=bottom)
    col        = 0.55,       -- col position (0=left, 1=right)
    border     = "rounded",  -- "none"|"single"|"double"|"rounded"|"thicc(c)(c)"
    backdrop   = 60,         -- 0 = fully opaque, 100 = disabled
    fullscreen = false,

    preview = {
      layout        = "vertical", -- "horizontal"|"vertical"|"flex"
      horizontal    = "right:50%",  -- preview position when layout=horizontal ("right:60%"/"left:50%")
      vertical      = "down:45%",   -- preview position when layout=vertical ("down:45%"/"up:50%")
      flip_columns  = 100,          -- with layout="flex", switch to vertical below this width
      hidden        = false,        -- start with preview hidden
      default       = "builtin",    -- "builtin"|"bat"|"cat"|"head"
      border        = "rounded",
      scrollbar     = "false",     -- false|"float"|"border"
      title         = true,
      wrap          = false,
      delay         = 20,
    },
  },

  fzf_opts = {
    ["--layout"] = "reverse",
  },

  file_icons  = true,
  git_icons   = true,
  color_icons = true,
})

local map = vim.keymap.set

map('n', '<leader>fa', function()
  fzf.files({ hidden = true, cmd = "rg --files --hidden --glob '!.git/*'" })
end, { desc = '[F]ind [A]ll files including dotfiles' })

map('n', '<leader>ff', fzf.files,     { desc = '[F]ind [F]iles' })
map('n', '<leader>fg', fzf.live_grep, { desc = '[F]ind by [G]rep' })
map('n', '<leader>fb', fzf.buffers,   { desc = '[F]ind [B]uffers' })
map('n', '<leader>fr', fzf.oldfiles,  { desc = '[F]ind [R]ecents' })
map('n', '<leader>fh', fzf.help_tags, { desc = '[F]ind [H]elp' })
